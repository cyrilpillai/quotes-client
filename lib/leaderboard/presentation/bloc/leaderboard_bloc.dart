import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/leaderboard_usecase.dart';
import '../models/leaderboard_item.dart';
import 'leaderboard_event.dart';
import 'leaderboard_state.dart';

@injectable
class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  final LeaderboardUseCase _leaderboardUseCase;

  LeaderboardBloc(this._leaderboardUseCase) : super(Empty()) {
    on<Initial>((event, emit) => _fetchChartItems(event, emit));
    on<RefreshClicked>((event, emit) => _fetchChartItems(event, emit));
  }

  void _fetchChartItems(
    LeaderboardEvent event,
    Emitter<LeaderboardState> emit,
  ) async {
    emit(Loading());
    final leaderboardData =
        await _leaderboardUseCase.fetchLeaderboard().catchError((error) {
      emit(Error(message: error.toString()));
    });

    final List<LeaderboardItem> result =
        leaderboardData.map((e) => LeaderboardItem.fromEntity(e)).toList();
    emit(Success(leaderboardItems: result));
  }
}

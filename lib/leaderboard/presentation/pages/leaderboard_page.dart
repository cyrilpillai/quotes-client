import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/widgets/app_bar.dart';
import '../../../core/presentation/widgets/circular_loading_view.dart';
import '../../../core/presentation/widgets/error_view.dart';
import '../../../di/setup.dart';
import '../../../utils/constants.dart';
import '../bloc/leaderboard_bloc.dart';
import '../bloc/leaderboard_event.dart';
import '../bloc/leaderboard_state.dart';
import '../widgets/leaderboard_list_view.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<LeaderboardBloc>(),
      child: Scaffold(
        appBar: getAppBar(showThemeChanger: true),
        body: const Content(),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaderboardBloc, LeaderboardState>(
      builder: (context, state) {
        if (state is Empty) {
          context.read<LeaderboardBloc>().add(Initial());
        } else if (state is Loading) {
          return const CircularLoadingView();
        } else if (state is Success) {
          return LeaderboardListView(
            leaderboardItems: state.leaderboardItems,
          );
        } else if (state is Error) {
          return ErrorView(
            title: genericErrorTitle,
            description: state.message.substring(0, 200),
            primaryButtonCta: 'Retry',
            onPrimaryButtonPressed: () =>
                context.read<LeaderboardBloc>().add(RefreshClicked()),
          );
        }
        return Container();
      },
    );
  }
}

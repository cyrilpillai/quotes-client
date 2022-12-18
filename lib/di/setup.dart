import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'setup.config.dart';

final injector = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async => await init(injector);
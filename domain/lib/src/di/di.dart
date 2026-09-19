import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(ignoreUnregisteredTypesInPackages: ['domain'])
void configureInjection() => getIt.init();

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../../features/data/pace_api_service.dart';
import '../../features/data/pace_repository_impl.dart';
import '../../features/domain/helpers/pace_time_helper.dart';
import '../../features/domain/repositories/pace_repository.dart';
import '../../features/pace_selector/view/provider/pace_selector_provider.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  if (sl.isRegistered<PaceSelectorProvider>()) return;

  // Register dependencies once before widgets ask Provider for state.
  sl.registerLazySingleton<http.Client>(() => http.Client());

  sl.registerLazySingleton<PaceApiService>(
    () => PaceApiService(sl<http.Client>()),
  );

  sl.registerLazySingleton<PaceRepository>(
    () => PaceRepositoryImpl(sl<PaceApiService>()),
  );

  sl.registerLazySingleton<PaceTimeHelper>(() => PaceTimeHelper());

  sl.registerFactory<PaceSelectorProvider>(
    () => PaceSelectorProvider(sl<PaceRepository>(), sl<PaceTimeHelper>()),
  );
}

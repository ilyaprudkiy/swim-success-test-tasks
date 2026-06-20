import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../../features/data/pace_api_service.dart';
import '../../features/pace_selector/view/provider/pace_selector_provider.dart';
final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<http.Client>(
        () => http.Client(),
  );

  sl.registerLazySingleton<PaceApiService>(
        () => PaceApiService(
      sl<http.Client>(),
    ),
  );

  sl.registerFactory<PaceSelectorProvider>(
        () => PaceSelectorProvider(
      sl<PaceApiService>(),
    ),
  );
}
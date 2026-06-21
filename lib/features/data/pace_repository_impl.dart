import '../domain/repositories/pace_repository.dart';
import 'pace_api_service.dart';

class PaceRepositoryImpl implements PaceRepository {
  PaceRepositoryImpl(this._apiService);

  final PaceApiService _apiService;

  @override
  Future<void> sendPace(int paceSeconds) {
    // This is the small bridge between domain code and the remote API.
    return _apiService.sendPace(paceSeconds);
  }
}

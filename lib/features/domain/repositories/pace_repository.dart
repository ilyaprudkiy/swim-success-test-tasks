// The provider uses this contract instead of talking to the API class directly.
abstract class PaceRepository {
  Future<void> sendPace(int paceSeconds);
}

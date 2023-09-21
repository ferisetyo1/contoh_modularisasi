import 'package:core/dependency.dart';

class ConnectivityHelper {
  final Connectivity _connectivity;
  ConnectivityHelper(this._connectivity);

  Future<bool> isConnected() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}

import 'package:connectivity/connectivity.dart'; 
  
//check if device is connected to wifi/data connection
Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print('Connected to a mobile network.');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('Connected to a wifi network.');
      return true;
    }
    return false;
  }
import 'dart:io';

class Helper{
  Helper._private();

  static final Helper _instance = Helper._private();

  factory Helper() {
    return _instance;
  }

  Future<bool> checkConnections() async {
    bool connection = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection = true;
      }
    } on SocketException catch (_) {
      connection = false;
    }
    return connection;
  }
}
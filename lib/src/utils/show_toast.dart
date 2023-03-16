import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  Future<void> showToast(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_LEFT,
    );
  }
}

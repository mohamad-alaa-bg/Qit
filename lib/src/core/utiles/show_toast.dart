import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> showToast(String meg, bool success) async{
  Fluttertoast.showToast(
    msg: meg,
    backgroundColor: success ? Colors.green : Colors.red,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16,
    timeInSecForIosWeb: 3,
    textColor: Colors.white
  );

}

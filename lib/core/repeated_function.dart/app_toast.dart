import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    webBgColor: "#000000",
    webPosition: "center",
    webShowClose: true,
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

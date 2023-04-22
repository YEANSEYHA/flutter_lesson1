import 'package:flutter/material.dart';

class NavUtil {
  static void go({required BuildContext context, required to}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => to));
  }
}

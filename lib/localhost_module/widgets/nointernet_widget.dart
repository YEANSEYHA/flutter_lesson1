import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  void Function() onRetry;

  NoInternetWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.warning_outlined),
        Text("Something went wrong"),
        ElevatedButton(
          onPressed: onRetry,
          child: Text("RETRY"),
        ),
      ],
    );
  }
}

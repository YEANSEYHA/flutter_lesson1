import 'package:flutter/material.dart';

class OfflineWidget extends StatelessWidget {
  void Function() onRetry;

  OfflineWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            "You're currently offline",
            style: TextStyle(color: Colors.white),
          ),
          TextButton(
            onPressed: onRetry,
            child: Row(
              children: [
                Icon(Icons.refresh),
                Text(
                  "RETRY",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

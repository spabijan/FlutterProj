import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorText,
    required this.retry,
  });

  final String errorText;
  final Function retry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 50,
            color: Colors.red,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Error $errorText',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => retry(),
              child: Text(
                'Retry',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

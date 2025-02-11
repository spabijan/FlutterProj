import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/widgets/custom_error_widget.dart';

class SplashSreen extends StatelessWidget {
  const SplashSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomErrorWidget(errorText: 'errorText', retry: () {}),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kriyeta_event_manage/views/onboard/onboard_widgets.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            onboardTopView(),
            onboardBottomView(context),
          ],
        ),
      ),
    ));
  }
}

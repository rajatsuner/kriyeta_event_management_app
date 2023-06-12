import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kriyeta_event_manage/router/router.dart';
import 'package:lottie/lottie.dart';

//Onboarding Title Text
Widget _titleText() {
  return Text(
    "Welcome to Event Junction",
    style: TextStyle(
      color: Colors.black,
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
    ),
  );
}

//Onboarding Subtitle Text
Widget _subtitleText() {
  return Text(
    "Event Management System",
    style: TextStyle(fontSize: 16.sp),
  );
}

//Onboarding Image
Widget _onboardImage() {
  return LottieBuilder.asset(
    "assets/lottie/women_mic.json",
    height: 250.sp,
  );
}

//Onboard TopView
Widget onboardTopView() {
  return Column(
    children: [
      SizedBox(
        height: 50,
      ),
      _titleText(),
      SizedBox(
        height: 5.h,
      ),
      _subtitleText(),
      SizedBox(
        height: 50.h,
      ),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: _onboardImage()),
      SizedBox(
        height: 50.h,
      ),
    ],
  );
}

//Onboarding Get Started Button
Widget _getStartedButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRouter.login, ModalRoute.withName(AppRouter.login));
    },
    child: Container(
      height: 50.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          "Get Started",
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black),
        ),
      ),
    ),
  );
}

//Headline
Widget _headline() {
  return Text(
    "The social media platform designed to get you enrich",
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
  );
}

//Sub headline
Widget _subHeadline() {
  return Text(
    "Event Junction is an app where users can leverage their social network to create, discover, share, and monetize events or services.",
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
    ),
  );
}

//Onboarding bottom action: head, subhead ,get started
Widget onboardBottomView(BuildContext context) {
  return Expanded(
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2)
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_headline(), _subHeadline(), _getStartedButton(context)],
      ),
    ),
  );
}

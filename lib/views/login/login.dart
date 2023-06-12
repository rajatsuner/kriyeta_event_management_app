import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kriyeta_event_manage/controller/auth_controller.dart';
import 'package:kriyeta_event_manage/core/common/loader.dart';
import 'package:kriyeta_event_manage/core/common/sign_in_button.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = ref.watch(authControllerProvider);
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Event Junction",
                      style: TextStyle(
                          fontSize: 28.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Discover | Create | Share",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                LottieBuilder.asset(
                  "assets/lottie/data_security.json",
                  height: 400.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: SignInButton(),
                )
              ],
            ),
          ),
          if (isLoading) showAuthLoader()
        ],
      ),
    );
  }
}

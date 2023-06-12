import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kriyeta_event_manage/controller/auth_controller.dart';
import 'package:kriyeta_event_manage/router/router.dart';
import 'package:kriyeta_event_manage/theme/Pallete.dart';

class SignInButton extends ConsumerWidget {
  final bool isFromLogin;
  const SignInButton({Key? key, this.isFromLogin = true}) : super(key: key);

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref
        .read(authControllerProvider.notifier)
        .signInWithGoogle(context, isFromLogin);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () => signInWithGoogle(context, ref),
      icon: Image.asset(
        "assets/icons/google.png",
        width: 35.w,
      ),
      label: Text(
        'Continue with Google',
        style: TextStyle(fontSize: 18.sp, color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallete.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Pallete.whitegrey),
          borderRadius: BorderRadius.circular(12.w),
        ),
      ),
    );
  }
}

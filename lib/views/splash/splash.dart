import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kriyeta_event_manage/controller/auth_controller.dart';
import 'package:kriyeta_event_manage/controller/data_controller.dart';
import 'package:kriyeta_event_manage/router/router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(DataController(ref), permanent: true);

    ref.read(authControllerProvider.notifier).checkUserAlreadyLoggedIn(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset("assets/lottie/women_mic.json", width: 180.w)),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kriyeta_event_manage/router/router.dart';
import 'package:kriyeta_event_manage/theme/Pallete.dart';
import 'package:lottie/lottie.dart';

enum CategoryType { meetup, hackathon }

class CreateEventScreen extends ConsumerWidget {
  CreateEventScreen({super.key});

  Widget category(
      String text, CategoryType category, WidgetRef ref, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (category == CategoryType.meetup) {
          Navigator.pushNamed(context, AppRouter.createMeetupEvent);
        }
        if (category == CategoryType.hackathon) {
          Navigator.pushNamed(context, AppRouter.createHackathonEvent);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            border: Border.all(color: Pallete.whitegrey)),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Event",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23.sp),
        ),
      ),
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: LottieBuilder.asset(
                "assets/lottie/balloon_rise.json",
              )),
          Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose event category",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      category("Meetup", CategoryType.meetup, ref, context),
                      category(
                          "Hackathon", CategoryType.hackathon, ref, context)
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}

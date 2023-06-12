import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kriyeta_event_manage/theme/Pallete.dart';
import 'package:kriyeta_event_manage/widgets/my_widgets.dart';
import 'package:timeago/timeago.dart' as timeAgo;

class NotificationView extends StatelessWidget {
  NotificationView({super.key});

  List<Map<String, String>> notiList = [
    {
      "image": "https://freesvg.org/img/abstract-user-flat-4.png",
      "date": "2023-06-11",
      "title": " invited you to join event",
      "name": "RJ"
    },
    {
      "image": "https://freesvg.org/img/abstract-user-flat-4.png",
      "date": "2023-06-11",
      "title": " invited you to join event",
      "name": "Karan"
    },
    {
      "image": "https://freesvg.org/img/abstract-user-flat-4.png",
      "date": "2023-06-11",
      "title": " invited you to join event",
      "name": "RJ"
    },
    {
      "image": "https://freesvg.org/img/abstract-user-flat-4.png",
      "date": "2023-06-11",
      "title": " invited you to join event",
      "name": "Karan"
    },
    {
      "image": "https://freesvg.org/img/abstract-user-flat-4.png",
      "date": "2023-06-11",
      "title": " invited you to join event",
      "name": "RJ"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: Color(0xffEEEEEE).withOpacity(0.9),
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 5,
                      color: Pallete.whitegrey,
                    );
                  },
                  itemBuilder: (context, i) {
                    String name = notiList[i]["name"]!;
                    String title = notiList[i]["title"]!;
                    String date = notiList[i]["date"]!;
                    String image = notiList[i]["image"]!;

                    return buildTile(name, title, DateTime.parse(date), image);
                  },
                  itemCount: notiList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                )),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  buildTile(String name, String title, DateTime subTitle, String image) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(color: Pallete.white2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(image),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: Pallete.black,
                        ),
                      ),
                      TextSpan(
                        text: title,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Pallete.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 73),
            child: Text(
              timeAgo.format(subTitle),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Pallete.genderTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildDate(String time) {
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      child: Text(
        time,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
          color: Pallete.black,
        ),
      ),
    );
  }
}

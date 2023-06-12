import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateHackathonScreen extends StatelessWidget {
  const CreateHackathonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Hackathon",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23.sp),
      )),
      body: Center(
        child: Text(
          "Coming Soon...",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.sp),
        ),
      ),
    );
  }
}

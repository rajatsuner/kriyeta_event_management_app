import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kriyeta_event_manage/controller/auth_controller.dart';
import 'package:kriyeta_event_manage/models/user_model.dart';
import 'package:kriyeta_event_manage/theme/Pallete.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userModel = ref.watch(userProvider);

    _logout(WidgetRef ref) {
      ref.read(authControllerProvider.notifier).logout(context);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: GestureDetector(
                  onTap: () {
                    _logout(ref);
                  },
                  child: Icon(Icons.logout)),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(),
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: const Text(
                    "Over 2+ years of experience in app development."),
              ),
              _buildTitle("Skills"),
              const SizedBox(height: 10.0),
              _buildSkillRow("Java", 0.35),
              const SizedBox(height: 5.0),
              _buildSkillRow("Firebase", 0.6),
              const SizedBox(height: 5.0),
              const SizedBox(height: 5.0),
              _buildSkillRow("Flutter", 0.8),
              const SizedBox(height: 30.0),
              _buildTitle("Experience"),
              _buildExperienceRow(
                  company: "Indore",
                  position: "Flutter Developer",
                  duration: "2022 - 2023"),
              _buildExperienceRow(
                  company: "ABC Pvt. Ltd.",
                  position: "Flutter Developer",
                  duration: "2020 - Current"),
              const SizedBox(height: 20.0),
              _buildTitle("Education"),
              const SizedBox(height: 5.0),
              _buildExperienceRow(
                  company: "IPS Academy",
                  position: "Btech in CSE",
                  duration: "2021 - 2025"),
              const SizedBox(height: 20.0),
              _buildTitle("Contact"),
              const SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  SizedBox(width: 30.0),
                  Icon(
                    Icons.mail,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "${FirebaseAuth.instance.currentUser!.email ?? "dummy@gmail.com"}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  SizedBox(width: 30.0),
                  Icon(
                    Icons.phone,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "+91-1234567890",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ));
  }

  //_launchURL(String url) async {
  // if (await canLaunchUrl(Uri.parse(url))) {
  //   await launchUrl(Uri.parse(url));
  // } else {
  //   throw 'Could not launch $url';
  // }
  //}

  ListTile _buildExperienceRow(
      {required String company, String? position, String? duration}) {
    return ListTile(
      leading: const Padding(
        padding: EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(
          Icons.circle,
          size: 12.0,
          color: Colors.black54,
        ),
      ),
      title: Text(
        company,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$position ($duration)"),
    );
  }

  Row _buildSkillRow(String skill, double level) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 16.0),
        Expanded(
            flex: 2,
            child: Text(
              skill.toUpperCase(),
              textAlign: TextAlign.right,
            )),
        const SizedBox(width: 10.0),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            color: Pallete.blue,
            value: level,
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Colors.black54,
          ),
        ],
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: <Widget>[
        SizedBox(width: 20.0),
        SizedBox(
            width: 80.0,
            height: 80.0,
            child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                    radius: 35.0,
                    backgroundImage: NetworkImage(
                        "${FirebaseAuth.instance.currentUser!.photoURL ?? "https://freesvg.org/img/abstract-user-flat-4.png"}")))),
        const SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${FirebaseAuth.instance.currentUser!.displayName ?? "Rajat Suner"}",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text("Flutter Developer"),
            const SizedBox(height: 5.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.local_activity,
                  size: 15.h,
                ),
                SizedBox(width: 10.0),
                Text(
                  "Indore, India",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

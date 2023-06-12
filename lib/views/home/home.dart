import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kriyeta_event_manage/router/router.dart';
import 'package:kriyeta_event_manage/theme/Pallete.dart';
import 'package:kriyeta_event_manage/views/dashboard/dashboard.dart';
import 'package:kriyeta_event_manage/views/feed/feed.dart';
import 'package:kriyeta_event_manage/views/notification/notification.dart';
import 'package:kriyeta_event_manage/views/profile/profile.dart';

final homeNavIndexProvider = StateProvider((ref) => 0);

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  List<Widget> veiwOptions = [
    FeedView(),
    DashboardView(),
    Container(),
    NotificationView(),
    ProfileView()
  ];

  void _onItemTapped(int index, WidgetRef ref, BuildContext context) {
    if (index == 2) {
      Navigator.pushNamed(context, AppRouter.createEvent);
      return;
    }
    ref.read(homeNavIndexProvider.notifier).update((state) => index);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentIndex = ref.watch(homeNavIndexProvider);

    return SafeArea(
      child: Scaffold(
        body: veiwOptions[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _onItemTapped(index, ref, context),
          selectedItemColor: Pallete.blue,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Image.asset(
                    'assets/icons/home_focus.png',
                    width: 25.w,
                    height: 25.w,
                  ),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Image.asset(
                    'assets/icons/home.png',
                    width: 25.w,
                    height: 25.w,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Image.asset(
                    'assets/icons/dashboard_focus.png',
                    width: 25.w,
                    height: 25.w,
                  ),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Image.asset(
                    'assets/icons/dashboard.png',
                    width: 25.w,
                    height: 25.w,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Image.asset(
                    'assets/icons/create_focus.png',
                    width: 25.w,
                    height: 25.w,
                  ),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Image.asset(
                    'assets/icons/create.png',
                    width: 25.w,
                    height: 25.w,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Image.asset(
                    'assets/icons/notification_focus.png',
                    width: 25.w,
                    height: 25.w,
                  ),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Image.asset(
                    'assets/icons/notification.png',
                    width: 25.w,
                    height: 25.w,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Image.asset(
                    'assets/icons/person_focus.png',
                    width: 25.w,
                    height: 25.w,
                  ),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Image.asset(
                    'assets/icons/person.png',
                    width: 25.w,
                    height: 25.w,
                  ),
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}

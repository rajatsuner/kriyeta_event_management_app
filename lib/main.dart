import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kriyeta_event_manage/firebase_options.dart';
import 'package:kriyeta_event_manage/router/router.dart';
import 'package:kriyeta_event_manage/theme/Pallete.dart';
import 'package:kriyeta_event_manage/views/onboard/onboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Pallete.white));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Event Junction',
          theme: ThemeData(
              scaffoldBackgroundColor: Pallete.background,
              textTheme: GoogleFonts.poppinsTextTheme(),
              appBarTheme: AppBarTheme(
                  backgroundColor: Pallete.white,
                  titleTextStyle: TextStyle(color: Pallete.black),
                  iconTheme: IconThemeData(color: Pallete.black),
                  elevation: 0)),
          routes: AppRouter.routeInfo,
          initialRoute: AppRouter.splash,
        );
      },
    );
  }
}

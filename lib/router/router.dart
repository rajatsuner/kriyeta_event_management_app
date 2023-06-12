import 'package:kriyeta_event_manage/views/create_event/create_event.dart';
import 'package:kriyeta_event_manage/views/event_detail/event_detail.dart';
import 'package:kriyeta_event_manage/views/hackathon/create_hackathon.dart';
import 'package:kriyeta_event_manage/views/home/home.dart';
import 'package:kriyeta_event_manage/views/login/login.dart';
import 'package:kriyeta_event_manage/views/meetup/create_meetup.dart';
import 'package:kriyeta_event_manage/views/onboard/onboard.dart';
import 'package:kriyeta_event_manage/views/splash/splash.dart';

class AppRouter {
  static String onboard = '/onboard';
  static String login = '/login';
  static String splash = '/splash';
  static String home = "/home";
  static String createEvent = "/create-event";
  static String createHackathonEvent = "/create-event/hackathon";
  static String createMeetupEvent = "/create-event/meetup";
  static String viewEventDetails = "/view-event-details";

  static var routeInfo = {
    splash: (context) => SplashScreen(),
    onboard: (context) => OnboardScreen(),
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(),
    createEvent: (context) => CreateEventScreen(),
    createHackathonEvent: (context) => CreateHackathonScreen(),
    createMeetupEvent: (context) => CreateMeetupScreen()
    // viewEventDetails:(context)=> EventDetails(feedModel: feedModel)
  };
}

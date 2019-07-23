import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_travel_concept/screens/main_screen.dart';
// import 'package:flutter_travel_concept/util/const.dart';
import 'screens/home.dart';
import 'screens/main_screen.dart';
import 'screens/splash_screen.dart';
import 'util/const.dart';

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(TravelApp());
  });
}

class TravelApp extends StatefulWidget {
  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      // home: MainScreen(),
      home: SplashScreen(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => new MainScreen(),
        '/home': (BuildContext context) => new Home(),
        // '/livestream': (BuildContext context) => new LiveStreamPage(),
        // // '/livestream': (BuildContext context) => new ChewieDemo(),
        // '/alarm': (BuildContext context) => new NewPage("Alarm"),
        // '/setting': (BuildContext context) => new NewPage("Setting"),
        // '/profile': (BuildContext context) => new NewPage("Profile"),
      },
    );
  }
}

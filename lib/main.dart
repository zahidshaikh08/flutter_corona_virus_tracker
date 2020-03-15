import 'package:catcher/catcher_plugin.dart';
import 'package:flutter/material.dart';
import 'package:rab_corona_virus_tracker/setup_files/service_locator.dart';
import 'package:rab_corona_virus_tracker/state/auth_store.dart';
import 'package:rab_corona_virus_tracker/state/time_line_store.dart';
import 'package:rab_corona_virus_tracker/ui/auth/forgot_password/forgot_password.dart';
import 'package:rab_corona_virus_tracker/ui/auth/sign_up/sign_up_screen.dart';
import 'package:rab_corona_virus_tracker/ui/home/home_screen.dart';
import 'package:rab_corona_virus_tracker/utils/AppRoutes.dart';
import 'package:rab_corona_virus_tracker/utils/twitter_theme.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'ui/auth/login/login_screen.dart';
import 'ui/intro/intro_screen.dart';

void main() {

  Catcher(
    Injector(
      inject: [
        Inject<AuthStore>(() => AuthStore()),
        Inject<TimelineStore>(() => TimelineStore()),
      ],
      builder: (_) => MyApp(),
    ), // debugConfig: debugOptions,
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    setupLocator(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: MyTwitterTheme.twitterLightTheme,
      darkTheme: MyTwitterTheme.twitterLightTheme,
      home: IntroScreen(),
      routes: {
        AppRoutes.intro: (context) => IntroScreen(),
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.forgotPassword: (context) => ForgotPasswordScreen(),
        AppRoutes.signUp: (context) => SignUpScreen(),
        AppRoutes.home: (context) => HomeScreen(),
      },
    );
  }
}

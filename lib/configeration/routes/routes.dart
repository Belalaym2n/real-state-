
import 'package:flutter/material.dart';

import '../../screens/login/login_screen.dart';
import '../../screens/sign_up/signUp.dart';
import '../../screens/splash.dart';


class AppRoutes {
  static const String login = "login";
  static const String signUp = "Sign";
  static const String home = "home";
  static const String splash = "/";
}

class Routes {
  static onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) =>SignUp(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return
              Scaffold(
                appBar: AppBar(
                  title: Text("unDefine"),
                ),
                body:undefinWidget() ,
              );
          },
        );
    }
  }

  static undefinWidget(){
    Container(
      child: Center(
        child: Text('unDefine'),
      ),
    );
  }
}

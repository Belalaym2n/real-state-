import 'dart:async';

import 'package:flutter/material.dart';
import 'package:real_state/configeration/routes/routes.dart';
import 'package:real_state/core/utils/app_images.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRoutes.login);
    });
    return Stack(


      children: [
        Container(
          decoration: BoxDecoration(
            //shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(image: AssetImage(AppImages.logo))
          ),

        )


      ],
    );
  }
}


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/screens/login/login_screen.dart';

import '../../configeration/routes/routes.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/app_strings.dart';

class SlidableTwo extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
        return
          Scaffold(

        resizeToAvoidBottomInset: false,
        body:  Column(
          children: [
            // SizedBox(
            //   height: 80.h,
            // ),

            SizedBox(
              //165
              height: 140.h,
            ),
            Center(
                child: Text(
                  AppStrings.slidetwo,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
            SizedBox(
              height: 90.h,
            ),

            Expanded(
              child: Stack(children: [
                Image(
                  image: AssetImage(AppImages.slid2),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Align(
                  heightFactor: 010.h,
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(180.w, 40.h),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: Colors.white))),
                      onPressed: () {
                        Navigator.of(context).push(createRoute());
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ]),
            )
          ],
        )




    );
  }
  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(10.0, 0.0);

        const end =
            Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.
        drive(tween  );
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

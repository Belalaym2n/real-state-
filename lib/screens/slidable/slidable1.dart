
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/configeration/routes/routes.dart';
import 'package:real_state/core/utils/app_images.dart';
import 'package:real_state/core/utils/app_strings.dart';
import 'package:real_state/screens/slidable/slidable_two.dart';

class Slidable extends StatefulWidget {


  @override
  State<Slidable> createState() => _SlidableOneState();
}

class _SlidableOneState extends State<Slidable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
      Column(
        // mainAxisAlignment: MainAxisAlignment.center,

          children: [

            SizedBox(
              height: 30.h,
            ),

            SizedBox(
              //165
              height: 140.h,
            ),
            Center(
                child: Text(
                  AppStrings.findHome,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),
            SizedBox(
              height: 10.h,
            ),
            Center(
                child: Text(
                  AppStrings.filter,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                )),
            SizedBox(
              height: 71.h,
            ),
            // Spacer(
            //   flex: 1,
            // ),


                Expanded(
                  child: Stack(children: [

                    Image(
                      image: AssetImage(
                  AppImages.slid1),

                          //AppImages.slid1),
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
                    // pushNamedAndRemoveUntil(
                    //     context, AppRoutes.slidable2, (route) => false);
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
                  ]),
                )
              // child: Image(
              //   image: AssetImage(AppImages.slid1),
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              // ),
         //   )
        ])







    );
  }


  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  SlidableTwo(),
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








  // ceneterElevated() {
  //   Stack(children: [
  //     Image(
  //       image: AssetImage(AppImages.slid1),
  //       fit: BoxFit.cover,
  //       width: double.infinity,
  //     ),
  //     Align(
  //       heightFactor: 08.h,
  //       alignment: Alignment.bottomCenter,
  //       child: ElevatedButton(onPressed: () {}, child: Text("Next")),
  //     ),
  //   ]);
  // }


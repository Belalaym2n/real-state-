import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/auth/operation_for_user.dart';
import 'package:real_state/core/utils/app_colors.dart';
import 'package:real_state/core/utils/app_images.dart';
import 'package:real_state/core/utils/app_strings.dart';

import '../../configeration/routes/routes.dart';

class SignUp extends StatelessWidget {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(
                  image: AssetImage(AppImages.logo),
                  fit: BoxFit.cover,
                ),

                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return 'please enter your email';
                    }

                    final bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                        .hasMatch(emailController.text);
                    if(!emailValid){
                      return 'please enter valid email';
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: AppColors.primary,
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: AppColors.primary,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'please enter your email',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: AppColors.primary, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: AppColors.primary, width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return 'please enter your password';
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: AppColors.primary,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      color: AppColors.primary,
                    ),
                    hintText: "please enter your password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: AppColors.primary, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: AppColors.primary, width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(220.w, 40.h),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: AppColors.primary, width: 1))),
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        OperationForUser.createUserWithEmailAndPassword(
                           emailController.text,
                            passwordController.text,
                            (){
                             Navigator.pushNamed(context, AppRoutes.login);
                            },
                            (e){
                             showDialog(context: context,
                               barrierDismissible: false,

                               builder: (context) => AlertDialog(
                               title: Text("Error"),
                               content: Text(e.toString()),
                               elevation: 0,
                               backgroundColor: Colors.white,
                                 actions: [
                                   ElevatedButton(onPressed: () {
                                     Navigator.pop(context);
                                   }, child: Text("Okey"))
                                 ],


                             ),);

                            });

                      }
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: AppColors.primary, fontSize: 25),
                    )),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(65.0),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.haveAccounte,
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.login);
                          },
                          child: Text(
                            AppStrings.login,
                            style: TextStyle(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
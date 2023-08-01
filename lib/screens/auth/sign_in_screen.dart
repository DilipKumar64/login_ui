import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_ui/constants.dart';
import 'package:login_ui/screens/component/custom_text_form_field.dart';

import '../component/custom_sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _signInKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: scaffoldGradient,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Hello Again!',
                  style: textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Welcome back you\'ve',
                  style:
                      textTheme.titleLarge!.copyWith(color: Color(0xFF656172)),
                ),
                Text(
                  'been missed!',
                  style:
                      textTheme.titleLarge!.copyWith(color: Color(0xFF656172)),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Form(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: usernameController,
                        hintText: 'Enter username',
                        isPassword: false,
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      CustomTextFormField(
                          controller: passwordController,
                          hintText: 'Password',
                          isPassword: true),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Recovery  Password',
                    style:
                        textTheme.bodySmall!.copyWith(color: Color(0xFF656172)),
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Container(
                  height: 53.h,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFf26969).withOpacity(0.3),
                        blurRadius: 30,
                        offset: Offset(0, 20),
                      ),
                    ],
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFf26969),
                        Color(0xFFfd6b68),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1.h,
                      width: size.width * 0.25,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 221, 221, 221),
                        Color(0xFFb5b2bc),
                      ])),
                    ),
                    Text(
                      'Or continue with',
                      style: textTheme.bodySmall,
                    ),
                    Container(
                      height: 1.h,
                      width: size.width * 0.25,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color(0xFFb5b2bc),
                        Color.fromARGB(255, 240, 240, 241),
                      ])),
                    ),
                  ],
                ),
                SizedBox(height: 45.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomSignInButton(
                      height: 40.h,
                      width: 60.w,
                      imagePath: 'assets/images/google.png',
                    ),
                    CustomSignInButton(
                      height: 45.h,
                      width: 70.w,
                      imagePath: 'assets/images/apple-logo.png',
                    ),
                    CustomSignInButton(
                      height: 40.h,
                      width: 60.w,
                      imagePath: 'assets/images/facebook.png',
                    ),
                  ],
                ),
                SizedBox(
                  height: 45.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member? ',
                      style: textTheme.bodySmall,
                    ),
                    Text(
                      'Register now',
                      style: textTheme.bodySmall!.copyWith(color: Colors.blue),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

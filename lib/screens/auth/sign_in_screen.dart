import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_ui/bloc/bloc/auth_bloc.dart';
import 'package:login_ui/constants.dart';
import 'package:login_ui/screens/component/custom_text_form_field.dart';

import '../component/custom_sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String id = 'sign_in_screen';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _signInKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                  style: textTheme.titleLarge!
                      .copyWith(color: const Color(0xFF656172)),
                ),
                Text(
                  'been missed!',
                  style: textTheme.titleLarge!
                      .copyWith(color: const Color(0xFF656172)),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Form(
                  key: _signInKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your email';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please a valid Email';
                          }
                          return null;
                        },
                        controller: emailController,
                        hintText: 'Enter username',
                        isPassword: false,
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      CustomTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password shold have atleast 6 charactor';
                            }
                            return null;
                          },
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
                    style: textTheme.bodySmall!
                        .copyWith(color: const Color(0xFF656172)),
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                InkWell(
                  onTap: () {
                    if (_signInKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(SignedIn(
                            email: emailController.text,
                            password: passwordController.text,
                          ));
                    }
                  },
                  child: BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthAuthenticated) {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      height: 53.h,
                      width: size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFf26969).withOpacity(0.3),
                            blurRadius: 30,
                            offset: const Offset(0, 20),
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
                      // fun: signInWithGoogle(),
                      fun: () {},
                      height: 40.h,
                      width: 60.w,
                      imagePath: 'assets/images/google.png',
                    ),
                    CustomSignInButton(
                      fun: () {},
                      height: 45.h,
                      width: 70.w,
                      imagePath: 'assets/images/apple-logo.png',
                    ),
                    CustomSignInButton(
                      fun: () {},
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

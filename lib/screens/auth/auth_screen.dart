import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_ui/constants.dart';

import '../component/top_asset.dart';

enum Auth { register, signIn }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.register;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: scaffoldGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopAsset(size: size),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Discover your Dream job here",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              softWrap: true,
            ),
            Text(
              "Dream job here",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              softWrap: true,
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            Text(
              'Explore all the most exiting jobs roles',
              style: TextStyle(fontSize: 22.sp),
            ),
            Text(
              'based on your intrest and study major',
              style: TextStyle(fontSize: 22.sp),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              padding: EdgeInsets.all(2),
              height: size.height * 0.06,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CustomButton(
                    fun: () {},
                    height: double.infinity,
                    width: size.width * 0.39,
                    title: 'Register',
                    auth: _auth,
                    authValue: Auth.register,
                  ),
                  Spacer(),
                  CustomButton(
                    fun: () {},
                    height: double.infinity,
                    width: size.width * 0.39,
                    title: 'Sign In',
                    auth: _auth,
                    authValue: Auth.signIn,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.fun,
    required this.title,
    required this.auth,
    required this.authValue,
  });

  final double height;
  final double width;
  final String title;
  final VoidCallback fun;
  Auth auth;
  final Auth authValue;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool state = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.auth = widget.authValue;
        });
      },
      child: Container(
        width: widget.width,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: (widget.auth == widget.authValue)
              ? null
              : const LinearGradient(
                  colors: [
                    Color(0xFFe8ecf6),
                    Color(0xFFedeaf0),
                  ],
                ),
        ),
        child: Center(child: Text(widget.title)),
      ),
    );
  }
}

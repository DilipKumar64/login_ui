import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_ui/constants.dart';
import 'package:login_ui/screens/auth/register_screen.dart';
import 'package:login_ui/screens/auth/sign_in_screen.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
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
                height: 55.h,
              ),
              Text(
                "Discover your ",
                style: textTheme.headlineSmall,
                softWrap: true,
              ),
              Text(
                "Dream job here",
                style: textTheme.headlineSmall,
                softWrap: true,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                'Explore all the most exiting jobs roles',
                style:
                    TextStyle(fontSize: 14.sp, color: const Color(0xFF9b98aa)),
              ),
              Text(
                'based on your intrest and study major',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF9b98aa),
                ),
              ),
              SizedBox(height: size.height * 0.08),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(2),
                  height: size.height * 0.075,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        stops: [0.43, 0.5, 0.75],
                        colors: [
                          Colors.white,
                          Color(0xFFe8ecf6),
                          Color(0xFFedeaf0),
                        ],
                      ),
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: size.width * 0.38,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Center(child: Text('Register')),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        },
                        child: Container(
                          width: size.width * 0.38,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFe8ecf6),
                                Color(0xFFedeaf0),
                              ],
                            ),
                          ),
                          child: const Center(child: Text('Sign In')),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

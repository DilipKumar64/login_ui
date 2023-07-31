import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignInButton extends StatelessWidget {
  const CustomSignInButton({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
  });
  final String imagePath;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Container(
          height: height - 2,
          width: width - 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFdfdde4),
                Color(0xFFe4e6ea),
              ],
            ),
          ),
          child: Center(
            child: SizedBox(
              height: 25.h,
              width: 25.w,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

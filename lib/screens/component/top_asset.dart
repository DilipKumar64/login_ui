import 'package:flutter/material.dart';

class TopAsset extends StatelessWidget {
  const TopAsset({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFdca1fe),
            Color(0xFFd796fb),
          ],
        ),
      ),
    );
  }
}

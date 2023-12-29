import 'package:flutter/material.dart';
import 'package:simple_ocr_app/helper/my_color.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        decoration: const BoxDecoration(
          color: MyColor.yellow,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(10),
        child: const Icon(
          Icons.arrow_back,
          color: MyColor.darkBlue,
        ),
      ),
    );
  }
}

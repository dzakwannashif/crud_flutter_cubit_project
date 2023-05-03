import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final double height;
  final double width;
  final Color backgroundColor;

  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.height,
      this.width = double.infinity,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          title,
        ),
      ),
    );
  }
}

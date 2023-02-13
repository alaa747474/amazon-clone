import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.mqWidth, required this.text, required this.onPressed,
  }) : super(key: key);

  final double mqWidth;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).cardColor,
        fixedSize: Size(mqWidth,30.h)
      ),
      onPressed: onPressed, child: Center(child: Text(text,style: Theme.of(context).textTheme.headline3 ,)));
  }
}

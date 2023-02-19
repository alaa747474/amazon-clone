import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignInButton extends StatelessWidget {
  const CustomSignInButton({super.key, required this.onPressed, required this.text,this.color=const Color.fromARGB(255, 246,207,112),});
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: Theme.of(context).shadowColor, width: 0.5),
            elevation: 0,
            backgroundColor: color),
        onPressed: onPressed,
        child: Text(text, style: Theme.of(context).textTheme.headline3),
      ),
    );
  }
}

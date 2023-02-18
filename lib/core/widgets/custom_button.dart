import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
  required this.text, required this.onPressed,this.elevation=0,this.borderWidth=0,
  this.color=const Color.fromARGB(255,254,216,21),
  }) : super(key: key);
  final double elevation;
  final String text;
  final Color? color;
  final VoidCallback onPressed;
  final double borderWidth;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r)
        ),
        side: BorderSide(
          width: borderWidth,
          color:borderWidth==0?Colors.transparent: Colors.black
        ),
        elevation: elevation,
        backgroundColor: color,
        fixedSize: Size(MediaQuery.of(context).size.width,40.h)
      ),
      onPressed: onPressed, child: Center(child: Text(text,style: Theme.of(context).textTheme.headline3 ,)));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCustomButton extends StatelessWidget {
  const ProfileCustomButton({
    Key? key, required this.buttonText, required this.onPressed,
  }) : super(key: key);
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).hoverColor,
        elevation: 0,
        foregroundColor: Theme.of(context).hintColor,
        shadowColor: Colors.transparent,
        shape:  StadiumBorder(
          side: BorderSide(color: Theme.of(context).hintColor, width: 1.r),
        ),
      ),
      child: Text(buttonText,style: Theme.of(context).textTheme.headline6,),
    );
  }
}

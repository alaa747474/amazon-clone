import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSettingsContainer extends StatelessWidget {
  const CustomSettingsContainer(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).shadowColor, spreadRadius: 0.7),
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.1),
                  spreadRadius: 0.5,
                  offset:const Offset(0,0),
                  blurRadius: 10
                ),
              ],
            ),
            height: 40.h,
            width: double.maxFinite,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

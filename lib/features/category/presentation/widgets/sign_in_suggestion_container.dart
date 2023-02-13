import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_amazon_app/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInSuggestionContainer extends StatelessWidget {
  const SignInSuggestionContainer({
    Key? key,
    required this.mqWidth,
  }) : super(key: key);

  final double mqWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
      height: 105.h,
      width: mqWidth,  
      color: Theme.of(context).primaryColorLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Sign in for the best experience',style: Theme.of(context).textTheme.headline2,),
          CustomButton(mqWidth: mqWidth,text: 'Sign in securly',onPressed: (){},),
          Text('create an account',style: Theme.of(context).textTheme.headline4!.copyWith(color: Theme.of(context).focusColor),),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile(
      {super.key,
      this.onExpansionChanged,
      required this.title,
      required this.child});
  final Function(bool)? onExpansionChanged;
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        leading: const Icon(Icons.radio_button_off),
        collapsedIconColor: Theme.of(context).shadowColor,
        iconColor: Theme.of(context).highlightColor,
        collapsedBackgroundColor: Theme.of(context).hoverColor,
        trailing: const SizedBox(),
        onExpansionChanged: onExpansionChanged,
        key: key,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        children: [
          Container(
            padding: EdgeInsets.all(10.h),
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: child,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w,right: 10.w,bottom: 10.h),
            child: RichText(text: TextSpan(
              text: '',
              children: [
                TextSpan(text: 'By continuing, you agree to ',style: Theme.of(context).textTheme.headline3,),
                TextSpan(text: ' Amazon\'s Conditions',style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.blue),),
                TextSpan(text: ' of Use and',style: Theme.of(context).textTheme.headline3),
                TextSpan(text: ' Privacy Notice',style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.blue),),
              ]
            )),
          )
          
        ]);
  }
}

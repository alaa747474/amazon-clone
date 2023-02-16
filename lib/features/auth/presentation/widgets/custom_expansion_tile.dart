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
          )
        ]);
  }
}

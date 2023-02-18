import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        alignment: Alignment.bottomCenter,
        appBarHeight: 40.h,
        child: Padding(
          padding: EdgeInsets.only(left: 5.w, top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amazon',
                style: Theme.of(context).textTheme.headline2,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Theme.of(context).backgroundColor,
                    Theme.of(context).backgroundColor.withOpacity(0.6),
                    Theme.of(context).backgroundColor.withOpacity(0.2),
                    Theme.of(context).scaffoldBackgroundColor
                  ])),
              child: Text(
                'Sign in for the best \n experience',
                style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}

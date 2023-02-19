import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/features/profile/presentation/screens/not_logged_in_profile_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
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
      body: NotLoggedInProfileScreen()
    );
  }
}

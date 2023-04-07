import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/create_account_expantion_tile.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/sign_in_sexpantion_tile.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen(
      {super.key,
      this.signInExpanded = false,
      this.createAccountExpanded = false});
  static const String routeName = '/sign_in_screen';
  final bool signInExpanded;
  final bool createAccountExpanded;
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: CustomAppBar(
          appBarHeight: 50.h,
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(
                width: 70.h,
              ),
              Text(
                'Amazon',
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  'Welcome',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Theme.of(context).primaryColorLight,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).hintColor, spreadRadius: 0.5),
                  ],
                ),
                child: Column(
                  children: [
                    CreateAccountExpantionTile(
                        createAccountExpanded: widget.createAccountExpanded),
                    SignInExpantionTile(signInExpanded: widget.signInExpanded),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

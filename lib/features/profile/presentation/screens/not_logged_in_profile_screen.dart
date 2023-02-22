import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/continue_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotLoggedInProfileScreen extends StatelessWidget {
  const NotLoggedInProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/box.jpg',
      'assets/images/bag.png',
      'assets/images/list.png'
    ];
    List<String> titles = [
      'Check order status and track, \nchange or return items',
      'Shop past purcases and \neveryday essentials',
      'Create list items you\nwant, now or later'
    ];
    return Column(
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
                  Theme.of(context).backgroundColor.withOpacity(0.8),
                  Theme.of(context).backgroundColor.withOpacity(0.7),
                  Theme.of(context).backgroundColor.withOpacity(0.4),
                  Theme.of(context).primaryColorLight.withOpacity(0.2),
                  Theme.of(context).primaryColorLight
                ])),
            child: Text(
              'Sign in for the best \n experience',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Column(
            children: [
              CustomSignInButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInScreen.routeName,
                        arguments: const SignInScreen(
                          signInExpanded: true,
                          createAccountExpanded: false,
                        ));
                  },
                  text: 'Sign in'),
              SizedBox(
                height: 10.h,
              ),
              CustomSignInButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignInScreen.routeName,
                      arguments: const SignInScreen(
                        createAccountExpanded: true,
                        signInExpanded: false,
                      ));
                },
                text: 'Create account',
                color: Theme.of(context).hoverColor,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Row(
                  children: [
                    Image.asset(
                      images[index],
                      width: 80.w,
                      height: 80.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      titles[index],
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline3,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

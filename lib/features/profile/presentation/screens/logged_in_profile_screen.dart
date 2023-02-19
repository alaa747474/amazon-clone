import 'package:flutter/material.dart';

class LoggedInProfileScreen extends StatelessWidget {
  const LoggedInProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      );
  }
}
import 'package:flutter/material.dart';

import 'package:flutter_amazon_app/core/widgets/custom_button.dart';
import 'package:flutter_amazon_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInSuggestionContainer extends StatelessWidget {
  const SignInSuggestionContainer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
      height: 105.h,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColorLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sign in for the best experience',
            style: Theme.of(context).textTheme.headline2,
          ),
          CustomButton(
            elevation: 1,
            text: 'Sign in securly',
            onPressed: () =>
                Navigator.pushNamed(context, SignInScreen.routeName,arguments: const SignInScreen(signInExpanded: true,createAccountExpanded: false,)),
          ),
          Text(
            'create an account',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Theme.of(context).focusColor),
          ),
        ],
      ),
    );
  }
}

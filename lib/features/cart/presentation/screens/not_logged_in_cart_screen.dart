import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_button.dart';
import 'package:flutter_amazon_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NotLoggedInCartScreen extends StatelessWidget {
  const NotLoggedInCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 395.h,
        color: Theme.of(context).primaryColorLight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieBuilder.network(
                'https://assets10.lottiefiles.com/packages/lf20_QpF8Pyx9gq.json',
                width: 200.w,
                height: 200.h,
              ),
              Text(
                'Your Amazon Cart is empty',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 25.sp),
              ),
              
              Text(
                'Nothing in here. Only possibilities',
                style: Theme.of(context).textTheme.bodyText1,
              ),
             SizedBox(height: 5.h,),
              Text('Shop today\'s deals',
                  style: Theme.of(context).textTheme.bodyText2),
               SizedBox(height: 20.h,),
              CustomButton(
                  text: 'Sign in to your account',
                  onPressed: () =>
                      Navigator.pushNamed(context, SignInScreen.routeName)),
              SizedBox(height: 5.h,),
              CustomButton(
                borderWidth: 0.1,
                elevation: 1.5,
                color: Theme.of(context).primaryColorLight,
                  text: 'Sign up now',
                  onPressed: () => Navigator.pushNamed(
                        context,
                        SignInScreen.routeName,
                      )),
            ],
          ),
        ),
      
    );
  }
}

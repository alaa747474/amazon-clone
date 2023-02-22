import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/core/widgets/custom_search_field.dart';
import 'package:flutter_amazon_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/sign_in_repository.dart';
import 'package:flutter_amazon_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter_amazon_app/features/home/business_logic/cubit/home_cubit.dart';
import 'package:flutter_amazon_app/features/home/business_logic/cubit/user_auth_state_cubit.dart';
import 'package:flutter_amazon_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_amazon_app/features/settings/presentation/widgets/custom_settings_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: 65.h,
        alignment: Alignment.bottomCenter,
        child: const CustomSearchField(),
      ),
      body: Container(
        height: double.infinity,
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
        child: BlocBuilder<UserAuthStateCubit, UserAuthStateState>(
          builder: (context, state) {
            if (state is UserLoggedInState) {
              return state.user == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomSettingsContainer(
                          text: 'Customer Service',
                          onPressed: () {},
                        ),
                        CustomSettingsContainer(
                          text: 'Sign in',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignInScreen.routeName,
                                arguments: const SignInScreen(
                                  signInExpanded: true,
                                  createAccountExpanded: false,
                                ));
                          },
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomSettingsContainer(
                          text: 'Customer Service',
                          onPressed: () {},
                        ),
                        CustomSettingsContainer(
                          text: 'Sign out',
                          onPressed: () {
                            SignInRepository(FirebaseAuth.instance).signOut();
                          },
                        ),
                      ],
                    );
            }
            return ErrorWidget('Error');
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/utils/service_locator.dart';
import 'package:flutter_amazon_app/core/widgets/custom_button.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/home/business_logic/cubit/home_cubit.dart';
import 'package:flutter_amazon_app/features/profile/business_logic/cubit/user_profile_cubit.dart';

import 'package:flutter_amazon_app/features/profile/presentation/widgets/keep_shopping_for_container.dart';
import 'package:flutter_amazon_app/features/profile/presentation/widgets/profile_custom_button.dart';
import 'package:flutter_amazon_app/features/profile/presentation/widgets/user_information_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoggedInProfileScreen extends StatelessWidget {
  const LoggedInProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:  getIt.get<UserProfileCubit>()..getUserInformation(),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            BlocBuilder<UserProfileCubit, UserProfileState>(
                builder: (context, state) {
              if (state is UserInformationLoaded) {
                return UserInformationRow(
                    userName: state.userModel.name.toString(),
                    userProfilePhoto: '');
              }
              return const LoadingIndicator();
            }),
            Container(
              color: Theme.of(context).primaryColorLight,
              height: 100.h,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10.r,
                    mainAxisSpacing: 10.r,
                    crossAxisCount: 2,
                    mainAxisExtent: 50.r),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return ProfileCustomButton(
                      buttonText: index == 0
                          ? 'Your Orders'
                          : index == 1
                              ? 'Buy Again'
                              : index == 2
                                  ? 'Your Account'
                                  : 'Your List',
                      onPressed: index==1?(){
                        context.read<HomeCubit>().changeIndex(0);
                      }:(){});
                },
              ),
            ),
            Container(
              color: Theme.of(context).primaryColorLight,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Orders',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Hi,you hane no recent orders',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return CustomButton(
                          borderWidth: 0.5,
                          color: Theme.of(context).primaryColorLight,
                          text: 'Return to the Homepage',
                          onPressed: () {
                            context.read<HomeCubit>().changeIndex(0);
                          });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const KeepShoppingForContainer(),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/auth/business_logic/create_account_cubit/create_account_cubit.dart';
import 'package:flutter_amazon_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter_amazon_app/features/auth/data/model/user.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/continue_button.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/custom_expansion_tile.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String routeName = '/sign_in_screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UniqueKey item1Key = UniqueKey();
  UniqueKey item2Key = UniqueKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(
                width: 70.h,
              ),
              Text(
                'Amazon',
                style: Theme.of(context).textTheme.headline2,
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
                      .headline2!
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
                    CustomExpansionTile(
                      key: item1Key,
                      onExpansionChanged: (value) {
                        if (value == true) {
                          setState(() {
                            item2Key = UniqueKey();
                          });
                        }
                      },
                      title: 'Create account',
                      child: BlocBuilder<CreateAccountCubit, CreateAccountState>(
                        builder: (context, state) {
                          if (state is CreateAccountLoading) {
                            return const Center(child: LoadingIndicator(),);
                          }
                          return Column(
                            children: [
                              CustomTextField(
                                textEditingController: nameController,
                                title: 'First and last name',
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomTextField(
                                textEditingController: emailController,
                                title: 'Email',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              CustomTextField(
                                textEditingController: passwordController,
                                title: 'Create a password',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              ContinueButton(
                                onPressed: () {
                                  context
                                      .read<CreateAccountCubit>()
                                      .createAccount(
                                          userModel: UserModel(
                                              nameController.text,
                                              emailController.text,
                                              passwordController.text),
                                          context: context);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    CustomExpansionTile(
                      key: item2Key,
                      onExpansionChanged: (value) {
                        if (value == true) {
                          setState(() {
                            item1Key = UniqueKey();
                          });
                        }
                      },
                      title: 'Sign in',
                      child:
                          BlocBuilder<SignInCubit, SignInState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              Column(
                                children: [
                                  CustomTextField(
                                    textEditingController: emailController,
                                    validator: (value) {
                                      return null;
                                    },
                                    title: 'Email',
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextField(
                                    textEditingController: passwordController,
                                    validator: (value) {
                                      return null;
                                    },
                                    title: 'Password',
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  ContinueButton(
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/auth/business_logic/create_account_cubit/create_account_cubit.dart';
import 'package:flutter_amazon_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter_amazon_app/features/auth/data/model/user.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/continue_button.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/custom_expansion_tile.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_amazon_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final TextEditingController createAccountPasswordController = TextEditingController();
  final TextEditingController createAccountEmailController = TextEditingController();
  final TextEditingController signInPasswordController = TextEditingController();
  final TextEditingController signInEmailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    createAccountEmailController.dispose();
    createAccountPasswordController.dispose();
    nameController.dispose();
    signInEmailController.dispose();
    signInPasswordController.dispose();
  }

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
      body: Form(
        key: formKey,
        child: Padding(
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
                          color: Theme.of(context).hintColor,
                          spreadRadius: 0.5),
                    ],
                  ),
                  child: Column(
                    children: [
                      CustomExpansionTile(
                        initiallyExpanded: widget.createAccountExpanded,
                        
                        title: 'Create account',
                        child: BlocConsumer<CreateAccountCubit,
                            CreateAccountState>(
                          listener: (context, state) {
                            if (state is CreateAccountDone) {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushNamed(
                                    context, HomeScreen.routeName);
                              }
                            }
                          },
                          builder: (context, state) {
                            if (state is CreateAccountLoading) {
                              return const Center(
                                child: LoadingIndicator(),
                              );
                            }
                            return Column(
                              children: [
                                CustomTextField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Invalid Name';
                                    }
                                    return null;
                                  },
                                  textEditingController: nameController,
                                  title: 'First and last name',
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomTextField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Invalid Email';
                                    }
                                    return null;
                                  },
                                  textEditingController:createAccountEmailController,
                                  title: 'Email',
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                CustomTextField(
                                  validator: (value) {
                                    if (value!.isEmpty ) {
                                      return 'Invalid Password';
                                    }
                                    return null;
                                  },
                                  textEditingController:createAccountPasswordController,
                                  title: 'Create a password',
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                CustomSignInButton(
                                  text: 'continue',
                                  onPressed: () {
                                    formKey.currentState!.validate();
                                    if (formKey.currentState!.validate()) {
                                      context
                                          .read<CreateAccountCubit>()
                                          .createAccount(
                                              userModel: UserModel(
                                                  nameController.text,
                                                  createAccountEmailController.text,
                                                  createAccountPasswordController.text),
                                              context: context);
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      CustomExpansionTile(
                        initiallyExpanded: widget.signInExpanded,
                        title: 'Sign in',
                        child: BlocConsumer<SignInCubit, SignInState>(
                          listener: (context, state) {
                            if (state is SignInDone) {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushNamed(
                                    context, HomeScreen.routeName);
                              }
                            }
                          },
                          builder: (context, state) {
                            if (state is SignInLoading) {
                              return const Center(
                                child: LoadingIndicator(),
                              );
                            }

                            return Column(
                              children: [
                                Column(
                                  children: [
                                    CustomTextField(
                                      textEditingController: signInEmailController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                         return 'Invalid Email';
                                        }
                                        return null;
                                      },
                                      title: 'Email',
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    CustomTextField(
                                      textEditingController: signInPasswordController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                         return 'Invalid Password';
                                        }
                                        return null;
                                      },
                                      title: 'Password',
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    CustomSignInButton(
                                      text: 'continue',
                                      onPressed: () {
                                        formKey.currentState!.validate();
                                        if (formKey.currentState!.validate()) {
                                          context.read<SignInCubit>().signIn(
                                              context: context,
                                              userModel: UserModel(
                                                  null,
                                                 signInEmailController.text,
                                                  signInPasswordController.text));
                                        }
                                      },
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
      ),
    );
  }
}

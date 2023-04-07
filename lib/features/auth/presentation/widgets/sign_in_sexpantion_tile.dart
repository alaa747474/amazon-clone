import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/continue_button.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/loading_indicator.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../business_logic/sign_in_cubit/sign_in_cubit.dart';
import '../../data/model/user.dart';
import 'custom_expansion_tile.dart';

class SignInExpantionTile extends StatefulWidget {
  const SignInExpantionTile({super.key, required this.signInExpanded});
  final bool signInExpanded;
  @override
  State<SignInExpantionTile> createState() => _SignInExpantionTileState();
}

class _SignInExpantionTileState extends State<SignInExpantionTile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController signInPasswordController =TextEditingController();
  final TextEditingController signInEmailController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    signInEmailController.dispose();
    signInPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomExpansionTile(
        initiallyExpanded: widget.signInExpanded,
        title: 'Sign in',
        child: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInDone) {
              if (formKey.currentState!.validate()) {
                Navigator.pushNamed(context, HomeScreen.routeName);
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
    );
  }
}

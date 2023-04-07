import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/continue_button.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/loading_indicator.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../business_logic/create_account_cubit/create_account_cubit.dart';
import '../../data/model/user.dart';
import 'custom_expansion_tile.dart';

class CreateAccountExpantionTile extends StatefulWidget {
  const CreateAccountExpantionTile(
      {super.key, required this.createAccountExpanded});
  final bool createAccountExpanded;

  @override
  State<CreateAccountExpantionTile> createState() =>
      _CreateAccountExpantionTileState();
}

class _CreateAccountExpantionTileState
    extends State<CreateAccountExpantionTile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController createAccountPasswordController =
      TextEditingController();
  final TextEditingController createAccountEmailController =
      TextEditingController();
  final TextEditingController signInPasswordController =
      TextEditingController();
  final TextEditingController signInEmailController = TextEditingController();
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
    return Form(
      key: formKey,
      child: CustomExpansionTile(
        initiallyExpanded: widget.createAccountExpanded,
        title: 'Create account',
        child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
          listener: (context, state) {
            if (state is CreateAccountDone) {
              if (formKey.currentState!.validate()) {
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            }
          },
          builder: (context, state) {
            if (state is CreateAccountLoading) {
              return const LoadingIndicator();
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
                  textEditingController: createAccountEmailController,
                  title: 'Email',
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Invalid Password';
                    }
                    return null;
                  },
                  textEditingController: createAccountPasswordController,
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
                      context.read<CreateAccountCubit>().createAccount(
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
    );
  }
}

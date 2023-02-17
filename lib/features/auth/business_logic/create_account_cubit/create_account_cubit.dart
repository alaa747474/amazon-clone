import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_amazon_app/core/utils/custom_snakbar.dart';
import 'package:flutter_amazon_app/features/auth/data/model/user.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/create_account_repository.dart';


part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit(this._createAccountRepository) : super(CreateAccountInitial());
  final CreateAccountRepository _createAccountRepository;
  createAccount({required UserModel userModel,required BuildContext context}){
    try {
      emit(CreateAccountLoading());
      _createAccountRepository.createAccount(userModel: userModel);
      emit(CreateAccountDone());
    } on FirebaseAuthException catch(e) {
      showCustomSnackBar(context: context, content: e.message.toString());
    }
  }
}

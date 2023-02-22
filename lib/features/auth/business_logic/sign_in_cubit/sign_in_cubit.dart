import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_amazon_app/core/utils/custom_snakbar.dart';
import 'package:flutter_amazon_app/features/auth/data/model/user.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/sign_in_repository.dart';


part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInRepository) : super(SignInInitial());
  final SignInRepository _signInRepository;
  signIn({required BuildContext context,required UserModel userModel}){
    try {
       emit(SignInLoading());
      _signInRepository.signIn(userModel);
      emit(SignInDone());
    } on FirebaseAuthException catch(e)  {
      showCustomSnackBar(context: context, content: e.message.toString());
    }
  }
  signOut(){
   try {
      emit(SignOutLoading());
     _signInRepository.signOut().then((value) {
      emit(SignOutDone());
   });
   } catch (e) {
     debugPrint(e.toString());
   }
  
  }
}

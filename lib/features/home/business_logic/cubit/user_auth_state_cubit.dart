import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'user_auth_state_state.dart';

class UserAuthStateCubit extends Cubit<UserAuthStateState> {
  UserAuthStateCubit() : super(UserAuthStateInitial());
  userAuthState(){
    FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(UserLoggedInState(user));
     });
  }
}

part of 'user_auth_state_cubit.dart';

@immutable
abstract class UserAuthStateState {}

class UserAuthStateInitial extends UserAuthStateState {}
class UserLoggedInState extends UserAuthStateState {
  final User? user;

  UserLoggedInState(this.user);
}


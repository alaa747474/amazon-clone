part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}
class SignInDone extends SignInState {}
class SignInLoading extends SignInState {}
class SignOutLoading extends SignInState {}
class SignOutDone extends SignInState {}
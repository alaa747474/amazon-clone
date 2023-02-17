part of 'create_account_cubit.dart';

@immutable
abstract class CreateAccountState {}

class CreateAccountInitial extends CreateAccountState {}
class CreateAccountLoading extends CreateAccountState{}
class CreateAccountDone extends CreateAccountState{}

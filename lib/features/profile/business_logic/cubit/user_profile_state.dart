part of 'user_profile_cubit.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {}
class UserInformationLoaded extends UserProfileState {
  final UserModel userModel;

  const UserInformationLoaded(this.userModel);
}

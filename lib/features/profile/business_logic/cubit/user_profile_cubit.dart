import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_amazon_app/features/auth/data/model/user.dart';
import 'package:flutter_amazon_app/features/profile/data/repository/user_profile_repository.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this._profileRepository) : super(UserProfileInitial());
  final UserProfileRepository _profileRepository;
  getUserInformation() async {
    try {
      _profileRepository.getUserInformation().then((value) {
        emit(UserInformationLoaded(value));
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

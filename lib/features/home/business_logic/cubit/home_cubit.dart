import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_amazon_app/features/cart/presentation/screens/logged_in_cart_screen.dart';
import 'package:flutter_amazon_app/features/category/presentation/screens/categories_screen.dart';
import 'package:meta/meta.dart';
import 'package:flutter_amazon_app/features/cart/presentation/screens/not_logged_in_cart_screen.dart';
import 'package:flutter_amazon_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter_amazon_app/features/settings/presentation/screens/settings_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int selectedIndex = 0;
  
  List screens = [
    const CategoryScreen(),
    const ProfileScreen(),
    
    const SettingScreen()
  ];
  changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeBottomNavIndex(selectedIndex));
  }
  
}

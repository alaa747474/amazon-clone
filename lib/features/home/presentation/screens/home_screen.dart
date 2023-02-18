
import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_amazon_app/features/home/business_logic/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName='/';
  @override
  Widget build(BuildContext context) {
    var homeCubit=context.read<HomeCubit>();
    FlutterNativeSplash.remove();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          
          bottomNavigationBar: const CustomBottomNavBar(),
          body: homeCubit.screens[homeCubit.selectedIndex],
        );
      },
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/home/business_logic/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                color: Theme.of(context).hintColor.withOpacity(0.5),
                blurRadius: 15,
                spreadRadius: 2
              )
            ],
            border: const Border(top: BorderSide(color: Colors.black, width: 0.5))
          ),
          child: BottomNavigationBar(
              onTap: (currentIndex) {
                context.read<HomeCubit>().changeIndex(currentIndex);
              },
              backgroundColor:Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).focusColor,
              unselectedItemColor: Theme.of(context).shadowColor,
              selectedIconTheme: const IconThemeData(size: 30),
              unselectedIconTheme: const IconThemeData(size: 30),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: context.read<HomeCubit>().selectedIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: '')
              ]),
        );
      },
    );
  }
}

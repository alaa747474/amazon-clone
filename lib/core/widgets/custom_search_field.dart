import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/search/presentation/screens/search_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SearchScreen.routeName);
      },
      child: Container(
        height: 36.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
          
   
              spreadRadius: 1,
              color: Theme.of(context).hintColor),
          BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 20,
              spreadRadius: 2,
              color: Theme.of(context).shadowColor.withOpacity(0.2)),
        ]),
        child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Theme.of(context).shadowColor,
                    ),
                    Text(
                      'Search Amazon',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Theme.of(context).hintColor),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_search_field.dart';


class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).backgroundColor
          ])),
      child: const CustomSearchField(),
    );
  }
}

import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 20,
            spreadRadius: 2,
            color: Theme.of(context).shadowColor.withOpacity(0.2)),
      ]),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Padding(
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
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).hintColor),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).hintColor),
                borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}

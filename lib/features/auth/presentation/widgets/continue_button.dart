import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              color: Theme.of(context).shadowColor,
              width: 0.5
            ),
            elevation: 0,
            backgroundColor: Theme.of(context).highlightColor
          ),
            onPressed: () {},
            child: Text(
              'Continue',
              style: Theme.of(context)
                  .textTheme
                  .headline3
            )));
  }
}


import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartDeleteButton extends StatelessWidget {
  const CartDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,height:30.h,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).hintColor,
            offset: const Offset(0, 0),
            blurRadius: 5,

          )
        ],
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Center(
        child: Text('Delete',style: Theme.of(context).textTheme.bodyText1,),
      )
    );
  }
}
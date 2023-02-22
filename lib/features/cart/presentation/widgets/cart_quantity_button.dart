import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartQuantityButton extends StatelessWidget {
  const CartQuantityButton({super.key, required this.quantity, required this.addOnTap, required this.removeOnTap});
 final int quantity;
 final VoidCallback addOnTap;
 final VoidCallback removeOnTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,height:30.h,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).hintColor,
            offset: const Offset(0, 0),
            blurRadius: 5,

          )
        ],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft:  Radius.circular(10),
            ),
            child: InkWell(
              onTap: removeOnTap,
              child: Container(
                width: 130/2.3.w,
                 color: Theme.of(context).primaryColorLight,
                 child: const Center(
                  child: Icon(Icons.remove),
                 ),
              ),
            ),
          ),
          Text(quantity.toString(),style: Theme.of(context).textTheme.bodyText1),
          ClipRRect(
            borderRadius:const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight:  Radius.circular(10),
            ),
            child: InkWell(
              onTap: addOnTap,
              child: Container(
                width: 130/2.3.w,
                color: Theme.of(context).primaryColorLight,
                child: const Center(
                  child:  Icon(Icons.add),
                 ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
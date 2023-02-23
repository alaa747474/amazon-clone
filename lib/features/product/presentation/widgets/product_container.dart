import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer(
      {super.key,
      required this.image,
      required this.name,
      required this.price});
  final String image;
  final String name;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      margin: EdgeInsets.symmetric(horizontal: 0.h, vertical: 5.h),
      width: double.maxFinite,
      height: 170.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Theme.of(context).primaryColorLight,
        boxShadow: [
          BoxShadow(color: Theme.of(context).hintColor, spreadRadius: 0.5),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            image,
            width: 140.w,
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Text(
                  'Deal',
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.red[800]),
                ),
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '\$ $price',
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

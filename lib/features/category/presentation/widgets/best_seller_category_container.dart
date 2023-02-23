import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_amazon_app/features/category/data/model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerCategoryContainer extends StatelessWidget {
  const BestSellerCategoryContainer({super.key, required this.category, required this.index});
  final Category category;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          index==0?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Best Seller Deals',style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 25.sp),),
                SizedBox(height: 15.h,),
                Center(child: Text('MUST-SEE DEALS',style: Theme.of(context).textTheme.headline2,)),
                SizedBox(height: 10.h,),
            ],
          ):const SizedBox(),
          Container(height: 300.h,width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(category.image),fit: BoxFit.cover)
          ),),

          Text(category.name,style: Theme.of(context).textTheme.headline2,)
        ],
      ),
    );
  }
}
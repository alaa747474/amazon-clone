import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductItem extends StatelessWidget {
  const CategoryProductItem({
    Key? key,
    required this.categoryProduct,
  }) : super(key: key);

  final Product categoryProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            categoryProduct.image,
            height: 130.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
              Text(
                categoryProduct.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text('\$${categoryProduct.price}',
                  style: Theme.of(context).textTheme.headline4),
              categoryProduct.bestSeller?Container(
                width: 80.w,
                color: Colors.red[700],
                child: Center(child: Text('Best Seller',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),),),
              ):const SizedBox()
              ],
             )
            ],
          )
        ],
      ),
    );
  }
}
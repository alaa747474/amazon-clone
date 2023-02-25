import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/custom_category_products.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {super.key, required this.categoryName, required this.categoryImage});
  final String categoryName;
  final String categoryImage;
  @override
  Widget build(BuildContext context) {
    final mqHeight =MediaQuery.of(context).size.height;
    final mqWidth =MediaQuery.of(context).size.width;
    return InkWell(
      onTap: ()=>Navigator.pushNamed(context, CustomCategoryProductsScreen.routeName,arguments: categoryName),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        width:mqWidth/2.5,
        height: mqHeight/6,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                  spreadRadius: 2,
                  color: Theme.of(context).shadowColor.withOpacity(0.2))
            ],
            borderRadius: BorderRadius.circular(5.r),
            color: Theme.of(context).primaryColorLight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: mqHeight*0.01, left: mqWidth*0.02),
              child: Text(
                categoryName,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Container(
              height: 130.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  image: DecorationImage(
                      image: NetworkImage(categoryImage), fit: BoxFit.cover)
                      ),
            )
          ],
        ),
      ),
    );
  }
}

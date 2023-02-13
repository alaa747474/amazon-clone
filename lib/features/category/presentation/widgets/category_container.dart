import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {super.key, required this.categoryName, required this.categoryImage});
  final String categoryName;
  final String categoryImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      width: 150,
      height: 170,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: const Offset(0, 0),
                spreadRadius: 2,
                color: Theme.of(context).shadowColor.withOpacity(0.2))
          ],
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColorLight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              categoryName,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            height: 160,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                image: DecorationImage(
                    image: NetworkImage(categoryImage), fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}

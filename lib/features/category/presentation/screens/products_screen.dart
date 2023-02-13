import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_button.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/category_stack.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/sign_in_suggestion_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mqHeight=MediaQuery.of(context).size.height;
    final mqWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          const CategoryStack(),
          SizedBox(height: mqHeight/6.5,),
          SignInSuggestionContainer(mqWidth: mqWidth),
          SizedBox(height: mqHeight/95,),
          Text('Alaa')
        ],
      ),
    );
  }
}





import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/category_stack.dart';


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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            height: mqHeight*0.16,
            width: mqWidth,  
            color: Theme.of(context).primaryColorLight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sign in for the best experience',style: Theme.of(context).textTheme.headline2,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).cardColor,
                      
                      fixedSize: Size(mqWidth,mqWidth*0.12)
                    ),
                    onPressed: (){}, child: Center(child: Text('Sign in securly',style: Theme.of(context).textTheme.headline3 ,))),
                Text('create an account',style: Theme.of(context).textTheme.headline3!.copyWith(color: Theme.of(context).focusColor),),
              ],
            ),
          )
        ],
      ),
    );
  }
}


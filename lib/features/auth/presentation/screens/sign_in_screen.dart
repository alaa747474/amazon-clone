import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String routeName = '/sign_in_screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {
  final List items=List.generate(2, (index) => {"id":index,"title":"title$index"});
  UniqueKey item1Key = UniqueKey();
  UniqueKey item2Key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: CustomAppBar(
          appBarHeight: 50.h,
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(
                width: 70.h,
              ),
              Text(
                'Amazon',
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                'Welcome',
                style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 400.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Theme.of(context).primaryColorLight,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).hintColor, spreadRadius: 0.5),
                ],
              ),
              child: Column(
                
             children: [
              ExpansionTile(
                onExpansionChanged: (value) {
                  if (value ==true) {
                    setState(() {
                      item2Key = UniqueKey();
                    });
                  }
                },
                key: item1Key,
                title: Text('Create account',style: Theme.of(context).textTheme.headline3,),
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 100.h,
                    color: Colors.amber,
                  )
                ]
              ),
              ExpansionTile(
                onExpansionChanged: (value) {
                  if (value ==true) {
                    setState(() {
                      item1Key = UniqueKey();
                    });
                  }
                },
                key: item2Key,
                title: Text('sign in',style: Theme.of(context).textTheme.headline3,),
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 300.h,
                    color: Colors.amber,
                  )
                ]),
                
             ],
                
         )) ],
        ),
      ),
    );
  }
}

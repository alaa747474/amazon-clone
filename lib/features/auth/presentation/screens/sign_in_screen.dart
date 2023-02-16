import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/continue_button.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/custom_text_field.dart';
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
        child: SingleChildScrollView(
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
                  leading: const Icon(Icons.radio_button_off),
                  collapsedIconColor: Theme.of(context).shadowColor,
                  iconColor: Theme.of(context).highlightColor,
                  collapsedBackgroundColor: Theme.of(context).hoverColor,
                  trailing:const SizedBox(),
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
                      padding: EdgeInsets.all(10.h),
                      width: double.maxFinite,
                      child: SingleChildScrollView(
                        child: Column(
                          children:[
                            const CustomTextField(title: 'First and last name',),
                            SizedBox(height: 10.h,),
                            const CustomTextField(title: 'Email',),
                            SizedBox(height: 15.h,),
                            const CustomTextField(title: 'Create a password',),
                            SizedBox(height: 15.h,),
                            const ContinueButton(),
                          ],
                        ),
                      ),
                    )
                    
                  ]
                ),
                ExpansionTile(
                     leading: const Icon(Icons.radio_button_off),
                  collapsedIconColor: Theme.of(context).shadowColor,
                  iconColor: Theme.of(context).highlightColor,
                  collapsedBackgroundColor: Theme.of(context).hoverColor,
                  trailing:const SizedBox(),
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
                      padding: EdgeInsets.all(10.h),
                      width: double.maxFinite,
                      child: SingleChildScrollView(
                        child: Column(
                          children:[
                            const CustomTextField(title: 'Email',),
                            SizedBox(height: 10.h,),
                            const CustomTextField(title: 'Password',),
                            SizedBox(height: 15.h,),
                            const ContinueButton(),
                          ],
                        ),
                      ),
                    )
                  ]),
                  
               ],
                  
           )) ],
          ),
        ),
      ),
    );
  }
}



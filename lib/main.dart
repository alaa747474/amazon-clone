import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/router/app_router.dart';
import 'package:flutter_amazon_app/core/utils/theme.dart';
import 'package:flutter_amazon_app/features/auth/business_logic/create_account_cubit/create_account_cubit.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/create_account_repository.dart';
import 'package:flutter_amazon_app/features/category/business_logic/cubit/category_cubit.dart';
import 'package:flutter_amazon_app/features/category/data/repository/category_repository.dart';
import 'package:flutter_amazon_app/features/home/business_logic/cubit/home_cubit.dart';
import 'package:flutter_amazon_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_amazon_app/features/product/business_logic/cubit/product_cubit.dart';
import 'package:flutter_amazon_app/features/product/data/repository/product_repository.dart';

import 'package:flutter_amazon_app/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
          BlocProvider(
            create: (context) =>
                CategoryCubit(CategoryRepository(FirebaseFirestore.instance))
                  ..getAllCategories(),
            child: Container(),
          ),
          BlocProvider(create:(context)=> ProductCubit(ProductRepository(FirebaseFirestore.instance))..getAllProducts(),),
          BlocProvider(
            create: (context) => CreateAccountCubit(CreateAccountRepository(FirebaseAuth.instance, FirebaseFirestore.instance)),
          )
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: HomeScreen.routeName,
                title: 'Amazon app',
                theme: AppTheme.theme(),
                debugShowCheckedModeBanner: false,
                
              );
            }));
  }
}

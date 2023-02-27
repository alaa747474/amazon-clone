
import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/core/widgets/custom_button.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_amazon_app/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:flutter_amazon_app/features/home/business_logic/cubit/home_cubit.dart';
import 'package:flutter_amazon_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_amazon_app/features/order/business_logic/cubit/order_cubit.dart';
import 'package:flutter_amazon_app/features/order/data/model/order_model.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryInformationScreen extends StatefulWidget {
  const DeliveryInformationScreen({
    super.key,
    required this.products,
    required this.total,
  });
  final List<Product> products;
  final String total;
  static const String routeName = '/delivery_information_screen';

  @override
  State<DeliveryInformationScreen> createState() =>
      _DeliveryInformationScreenState();
}

class _DeliveryInformationScreenState extends State<DeliveryInformationScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: CustomAppBar(
        alignment: Alignment.bottomCenter,
        appBarHeight: 45.h,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.w, right: 8.w),
              child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back)),
            ),
            Text(
              'Enter a delivery address',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.r),
        children: [
          CustomTextField(
              title: 'Full Name ', textEditingController: fullNameController),
          SizedBox(height: 10.h,),    
          CustomTextField(
              title: 'Address', textEditingController: addressController),
          SizedBox(height: 10.h,), 
          CustomTextField(
              title: 'Town/City', textEditingController: cityController),
          SizedBox(height: 10.h,), 
          CustomTextField(
              title: 'Country', textEditingController: countryController),
          SizedBox(height: 10.h,), 
          CustomTextField(
              phoneNumberType: true,
              title: 'Phone Number',
              textEditingController: phoneNumberController),
              SizedBox(height: 20.h,),
          BlocConsumer<OrderCubit, OrderState>(
            listener: (context, state) {
              if (state is OrderConfirmationDone) {
                context.read<CartCubit>().deleteCart();
                context.read<HomeCubit>().changeIndex(0);
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.routeName, (route) => false);
              }
            },
            builder: (context, state) {
              if (state is OrderConfirmationLoading) {
                return const LoadingIndicator();
              }
              return CustomButton(
                  text: 'Use this address',
                  onPressed: () {
                    final order = OrderModel(
                        fullNameController.text,
                        phoneNumberController.text,
                        cityController.text,
                        addressController.text,
                        widget.total,
                        widget.products,
                        countryController.text);
                    context
                        .read<OrderCubit>()
                        .orderConfirmation(orderModel: order);
                  });
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.title, this.validator, required this.textEditingController}) : super(key: key);
  final String title;
  final String? Function(String?)? validator;
 final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          controller: textEditingController,
          validator: validator,
          cursorColor: Colors.orange,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).hintColor)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange)),
          ),
        ),
      ],
    );
  }
}

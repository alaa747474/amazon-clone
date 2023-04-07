import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/search/business_logic/cubit/search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key,required this.onChanged, required this.searchController, required this.clearSearchMethod});
 final void Function(String)? onChanged;
 final TextEditingController searchController;
 final VoidCallback clearSearchMethod;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 20,
            spreadRadius: 2,
            color: Theme.of(context).shadowColor.withOpacity(0.2)),
      ]),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return TextFormField(
            controller: searchController,
            onChanged: onChanged,
            autofocus: true,
            cursorHeight: 23.h,
            style: TextStyle(
                color: Theme.of(context).shadowColor,
                fontSize: 20.sp,
                height: 1.h),
            cursorWidth: 2.w,
            cursorColor: Theme.of(context).focusColor,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Theme.of(context).hintColor),
                hintText: 'Search Amazon',
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).shadowColor,
                ),
                suffixIcon:IconButton(
                icon: Icon(  Icons.clear,
                  color: Theme.of(context).shadowColor,),
                  onPressed: clearSearchMethod,
                ) ,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).hintColor),
                    borderRadius: BorderRadius.circular(10.r)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).hintColor),
                    borderRadius: BorderRadius.circular(10.r)),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor),
          );
        },
      ),
    );
  }
}

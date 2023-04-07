import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInformationRow extends StatelessWidget {
  const UserInformationRow({
    Key? key, required this.userName, required this.userProfilePhoto,
  }) : super(key: key);
  final String userName;
  final String userProfilePhoto;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.h,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Theme.of(context).secondaryHeaderColor,
              Theme.of(context).secondaryHeaderColor.withOpacity(0.9),
              Theme.of(context).secondaryHeaderColor.withOpacity(0.8),
              Theme.of(context).secondaryHeaderColor.withOpacity(0.7),
              Theme.of(context).secondaryHeaderColor.withOpacity(0.4),
              Theme.of(context).primaryColorLight.withOpacity(0.5),
              Theme.of(context).primaryColorLight
            ])),
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Hello,',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 20.r,
              )
            ],
          ),
        ));
  }
}

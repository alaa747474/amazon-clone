import 'package:flutter/material.dart';



class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar({super.key,required this.appBarHeight, required this.alignment, required this.child,});
 final double appBarHeight;
 final Widget child;
 final AlignmentGeometry alignment;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize =>  Size.fromHeight(appBarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding:const EdgeInsets.all(10),
      alignment: widget.alignment,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              
              colors:widget.appBarHeight<90 ?[
            Theme.of(context).primaryColor,
            Theme.of(context).backgroundColor,
              ]: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
            Theme.of(context).backgroundColor,
            Theme.of(context).backgroundColor.withOpacity(0.9),
            Theme.of(context).backgroundColor.withOpacity(0.8),
            Theme.of(context).scaffoldBackgroundColor
          ])),
      child: widget.child,
    );
  }
}

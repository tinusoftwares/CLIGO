
import 'package:flutter/material.dart';

class CtmHeaderListTitleWidget extends StatefulWidget {

  final String titleName;
  final IconData iconPath;
  final Function()? onTapTitle; // nullable and optional

  const CtmHeaderListTitleWidget(
      {Key? key,
        required this.titleName,
        required this.iconPath, // non-nullable but optional with a default value
        this.onTapTitle, // nullable and optional
      })
      : super(key: key);

  @override
  State<CtmHeaderListTitleWidget> createState() => _CtmHeaderListTitleWidgetState();
}

class _CtmHeaderListTitleWidgetState extends State<CtmHeaderListTitleWidget> {
  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(widget.iconPath, size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary,),
      title: Text(widget.titleName,style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).colorScheme.secondary),),
      onTap:widget.onTapTitle
    );
  }
}

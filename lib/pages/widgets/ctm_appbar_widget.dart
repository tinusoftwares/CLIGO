

import 'package:flutter/material.dart';

class CtmAppBarWidget extends StatelessWidget {

  String? appTitle;


  CtmAppBarWidget(this.appTitle);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(appTitle??''),
    );
  }
}

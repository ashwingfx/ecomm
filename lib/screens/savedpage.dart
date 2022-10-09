import 'package:flutter/material.dart';

import '../widgets/topbar.dart';
class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  TopBar(topBarTitle: "Your Titles",leftArrow: true,)
    );
  }
}

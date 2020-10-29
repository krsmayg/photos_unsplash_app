import 'package:flutter/material.dart';
import 'package:photo_viewer_app/widgets/reusableWidgets.dart';
import '../widgets/image_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: ReusableWidgets(context).getAppBar('Gallery'),
      bottomNavigationBar: ReusableWidgets(context).getBottomNav(),
      body: Column(
        children: <Widget>[ImageList()],
      ),
    ));
  }
}

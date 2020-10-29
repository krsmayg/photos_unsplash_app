import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinnerLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 300),
        child: SpinKitFadingCube(
          color: Colors.blue,
          size: 100.0,
        ),
      ),
    );
  }
}

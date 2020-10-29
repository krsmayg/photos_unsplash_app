import 'package:flutter/material.dart';

class ReusableWidgets {
  BuildContext context;
  ReusableWidgets(this.context);
  getAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  getBottomNav() {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
    ]);
  }
}

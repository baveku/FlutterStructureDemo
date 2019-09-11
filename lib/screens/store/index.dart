import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }

  Widget renderAppBar() {
    return AppBar();
  }

  Widget renderListView() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("text"),
          Text("text"),
          Text("text"),
        ],
      ),
    );
  }
}

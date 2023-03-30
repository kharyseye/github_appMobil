import 'package:flutter/material.dart';

import '../../widgets/drawer.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer : Mydrawer(),
      appBar: AppBar(title: Text("Home",style: TextStyle(fontSize: 25, color: Colors.white)),),
      body: Center(
        child: Text("Welcome to the Home Page",
        style: Theme.of(context).textTheme.headline4,
        ),

      ),
    );
  }
}

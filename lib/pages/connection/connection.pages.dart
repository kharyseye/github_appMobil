import 'package:flutter/material.dart';

import '../../widgets/drawer.widget.dart';

class ConPage extends StatelessWidget {
  const ConPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Connection",style: TextStyle(fontSize: 25, color: Colors.white)),),
      body: Center(
        child: Text("learning progress...",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

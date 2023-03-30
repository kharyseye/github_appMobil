import 'package:flutter/material.dart';
import 'package:github_mobilapp/pages/connection/connection.pages.dart';
import 'package:github_mobilapp/pages/home/home.page.dart';
import 'package:github_mobilapp/pages/users/users.page.dart';

void main() => runApp(GithubProject());


class GithubProject extends StatelessWidget {
  const GithubProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lime),
      routes: {
        "/":(context) => HomePage(),
        "/users":(context) => UsersPage(),
        "/disconnect":(context) => ConPage()
      },
      initialRoute: "/",
    );
  }
}

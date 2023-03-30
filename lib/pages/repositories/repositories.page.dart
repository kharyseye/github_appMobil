import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RepositoriesPage extends StatefulWidget {
  String? login;
  String avatarUrl;
  RepositoriesPage({this.login, required this.avatarUrl});

  @override
  State<RepositoriesPage> createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<RepositoriesPage> {
dynamic dataRepositories;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRepositories();
  }
  void loadRepositories() async{
    String url = "https://api.github.com/users/${widget.login}/repos";
    Uri uri = Uri.parse(url);
    http.Response response =   await http.get(uri);
    if(response.statusCode==200){
      setState(() {
        dataRepositories=json.decode(response.body);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Repositories ${widget.login}' ,style: TextStyle(fontSize: 25, color: Colors.white)),
          actions: [
            CircleAvatar(backgroundImage: NetworkImage(widget.avatarUrl),)
          ],
      ),

      body: Center(
        child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text("${dataRepositories[index]['name']}"),
            ),
            separatorBuilder:  (context, index) => Divider(height: 2, color: Colors.green,),
            itemCount: dataRepositories==null?0:dataRepositories.length
        ),
      ),
    );
  }


}



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../widgets/drawer.widget.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String? query;
  bool notvisibale=false;
  TextEditingController queryTextEditingController = new TextEditingController();
  dynamic data=null;
  int currentPage=0;
  int totalPages=0;
  int pageSize=20;
  ScrollController scrollController = new ScrollController();
  List<dynamic> items = [];

  Future<void> _search(String? query) async {

    String url="https://api.github.com/search/users?q=${query}&per_page=$pageSize&page=$currentPage";
    Uri uri = Uri.parse(url);
    print(url);
    await http.get(uri)
        .then((response) {
          print(response.body);
          setState(() {
            this.data=json.decode(response.body);
            this.items.addAll(data['items']);
            if(data['total_count']% pageSize ==0){
              totalPages = data['total_count']~/pageSize;
            }else totalPages = (data['total_count']/pageSize).floor() + 1;
          });
    })
        .catchError((err){
          print(err);
    });
  }
  @override
  void initState() {
    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        setState(() {
          if(currentPage<totalPages-1){
            ++currentPage;
            _search(query);
          }
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users => ${query} => $currentPage / $totalPages'  ,
          style: TextStyle(fontSize: 25, color: Colors.white) ),),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: notvisibale,
                      onChanged: (value){
                        setState(() {
                          this.query=value;
                        });
                      },
                      controller: queryTextEditingController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                notvisibale =! notvisibale;
                              });
                            },
                            icon :Icon(
                                notvisibale==true?Icons.visibility_off_outlined:Icons.visibility),
                          ),

                          contentPadding: EdgeInsets.only(left: 30),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.green
                              )
                          )
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: (){
                      setState(() {
                        items=[];
                        currentPage=0;
                        this.query =queryTextEditingController.text;
                        _search(query);
                        print(query);
                      });
                    },
                    icon: Icon(Icons.search, color: Colors.lime,))
              ],
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                  itemCount: items.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(items[index]['avatar_url']),
                                radius: 40,
                              ),
                              SizedBox(width: 20,),
                              Text("${items[index]['login']}"),
                            ],
                          ),
                          CircleAvatar(
                            child: Text("${items[index]['score']}"),
                          )
                        ],

                      ),

                    );
                  }
              ),
            )

          ],
        )
      ),
    );
  }
  
}

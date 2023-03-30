import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: [
            DrawerHeader(
            decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
                  Colors.white,
                Colors.lime
                ]
            ),
          ),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avatar.jpg'),
                  radius: 40,
                  ),
                  ),
                  ),
                 ListTile(
                   title: Text('Home', style: TextStyle(fontSize: 30, color: Colors.green),),
                   leading: Icon(Icons.home_outlined, color: Colors.green,),
                   trailing: Icon(Icons.arrow_forward_ios, color: Colors.green,),
                   onTap: (){
                     Navigator.of(context).pop();
                     Navigator.pushNamed(context, "/");
                   },
                 ),
            Divider(color: Colors.green, height: 4,),
            ListTile(
              title: Text('Users', style: TextStyle(fontSize: 30, color: Colors.green),),
              leading: Icon(Icons.person_2_outlined, color: Colors.green,),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.green,),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/users");
              },
            ),
            Divider(color: Colors.green, height: 4,),
            ListTile(
              title: Text('Disconnect', style: TextStyle(fontSize: 30, color: Colors.green),),
              leading: Icon(Icons.logout_outlined, color: Colors.green,),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.green,),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/disconnect");
              },
            ),
            Divider(color: Colors.green, height: 4,)
          ]
      ),
    );
  }
}

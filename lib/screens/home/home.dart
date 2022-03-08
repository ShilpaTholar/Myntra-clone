
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myntra/models/myuser.dart';
import 'package:myntra/screens/home/categories.dart';
import 'package:myntra/screens/home/list.dart';
import 'package:myntra/screens/home/products.dart';
import 'package:myntra/services/auth.dart';

class Home extends StatelessWidget {
  

  final AuthService _auth = AuthService();
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
       appBar: AppBar(title: Text("Myntra"), backgroundColor: Colors.pink[400], actions: [
              
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.favorite),
              ),
              SafeArea(
              child:Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.shopping_bag),
              ),
              )
              
            ]),
         drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            DrawerHeader(
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(color: Colors.blue, image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/photos/flying-shopping-cart-with-shopping-bags-on-a-pink-background-picture-id1292443598?b=1&k=20&m=1292443598&s=170667a&w=0&h=_MM45Mxfq5PXtEEYpuMbMunr3u9YRQK8jgxQTo8UhKY="), fit: BoxFit.cover)),
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text('Shop by categories'),
               onTap: () async {
                 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Categories()),
              );

              },

              ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
      ),
      body:Products(),
      ),
    );
  }
}
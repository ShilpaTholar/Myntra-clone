// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:myntra/models/myproduct.dart';
// import 'package:myntra/models/myuser.dart';
// import 'package:myntra/screens/home/categories.dart';
// import 'package:myntra/screens/home/products.dart';
// import 'package:myntra/services/auth.dart';
// import 'package:flutter/material.dart';
// import 'package:myntra/services/database.dart';
// import 'package:provider/provider.dart';

// class ProductList extends StatelessWidget {
  

//   final AuthService _auth = AuthService();
  

//   @override
//   Widget build(BuildContext context) {
//     final prods = Provider.of<List<MyProduct>>(context);

//     void _showSettingsPanel() {
//       showModalBottomSheet(context: context, builder: (context) {
//         return Container(
//           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
//         );
//       });
//     }

//     return StreamProvider<List<MyProduct>>.value(
//       value: DatabaseService(uid: '').product,
//       initialData: [],
//       child: Scaffold(
//         backgroundColor: Colors.brown[50],
//         appBar: AppBar(
//           title: Text('Brew Crew'),
//           backgroundColor: Colors.brown[400],
//           elevation: 0.0,
//           actions: <Widget>[
//             FlatButton.icon(
//               icon: Icon(Icons.person),
//               label: Text('logout'),
//               onPressed: () async {
//                 await _auth.signOut();
//               },
//             ),
//             FlatButton.icon(
//               icon: Icon(Icons.settings),
//               label: Text('settings'),
//               onPressed: () => _showSettingsPanel(),
//             )
//           ],
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/coffee_bg.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: ListView.builder(
//       itemCount: prods.length,
//       itemBuilder: (context, index) {
//         return (Text(prods[index].name));
//       }
//         ),
//       ),
//     ));
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myntra/models/myuser.dart';
import 'package:myntra/screens/authenticate/register.dart';
import 'package:myntra/screens/authenticate/signin.dart';
import 'package:myntra/screens/home/categories.dart';
import 'package:myntra/screens/home/home.dart';

import 'package:myntra/screens/wrapper.dart';
import 'package:myntra/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


Future<void>  main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options:DefaultFirebaseOptions.currentPlatform,
  //     );
      
//   try{
//     await Firebase.initializeApp(
//       name: 'myntra-clone',
//       options: const FirebaseOptions(
//         apiKey: "AIzaSyBgnmypbYfsKLBd6d_k7jLukcYjyXbKKJQ",
//         appId: "1:806612693237:android:fb67ffc208ff8fbcac95bc",
//         messagingSenderId: "806612693237",
//         projectId: "myntra-clone-c27cf",
//       ),
//     );
//   } on FirebaseException catch (e) {
//     if (e.code == 'duplicate-app') {
// // you can choose not to do anything here or either
// // In a case where you are assigning the initializer instance to a FirebaseApp variable, // do something like this:
// //
// //   app = Firebase.app('SecondaryApp');
// //
//     } else {
//       throw e;
//     }
//   } catch (e) {
//     rethrow;
//   }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        // home: Wrapper(),
        initialRoute: '/',
        routes:{
          '/':(context)=>Wrapper(),
          '/home':(context)=>Home(),
        }
      ),
    );
  }
}



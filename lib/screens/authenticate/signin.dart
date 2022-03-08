
// import 'package:flutter/material.dart';
// import 'package:myntra/services/auth.dart';

// class SignIn extends StatefulWidget {

//   final Function toggleView;
//   SignIn({ required this.toggleView });

//   @override
//   _SignInState createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {

//   final AuthService _auth = AuthService();

//   // text field state
//   String email = '';
//   String password = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.brown[100],
//       appBar: AppBar(
//         backgroundColor: Colors.brown[400],
//         elevation: 0.0,
//         title: Text('Sign in to Brew Crew'),
//         actions: <Widget>[
//           FlatButton.icon(
//             icon: Icon(Icons.person),
//             label: Text('Register'),
//             onPressed: () => widget.toggleView(),
//           ),
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//         child: Form(
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 20.0),
//               TextFormField(
//                 onChanged: (val) {
//                   setState(() => email = val);
//                 },
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 obscureText: true,
//                 onChanged: (val) {
//                   setState(() => password = val);
//                 },
//               ),
//               SizedBox(height: 20.0),
//               RaisedButton(
//                 color: Colors.pink[400],
//                 child: Text(
//                   'Sign In',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 onPressed: () async {
//                   print(email);
//                   print(password);
//                 }
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:myntra/screens/home/home.dart';
import 'package:myntra/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({required this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                 decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
              ),
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                 decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
              ),
                validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        error = 'Could not sign in with those credentials';
                      });
                    }
                   
                   
                      
                    
                
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
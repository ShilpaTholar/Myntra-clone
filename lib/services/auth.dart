
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myntra/models/myuser.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user => null;

  // create user obj based on firebase user
  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser?> get user {
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anon
  // Future signInAnon() async {
  //   try {
  //     AuthResult result = await _auth.signInAnonymously();
  //     FirebaseUser user = result.user;
  //     return _userFromFirebaseUser(user);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // sign in with email and password


  // register with email and password
  Future registerWithEmailAndPassword(String email , String password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(err){
      print(err.toString());
      return null ;
    }
  }
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return  _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }


  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}
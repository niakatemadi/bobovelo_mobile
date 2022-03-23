import 'package:appmobile_bobovelo/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appmobile_bobovelo/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

   // Create user object based on firebaseUser

  User1 _userFromFirebaseUser(User user){
    
    return User1(uid : user.uid);
    
  }


  // Auth change user stream

  Stream<User1> get user {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
  }

  // register with email and password
  
  Future registerWithEmailAndPassword(String email, String motdepasse, String nom, String prenom, String telephone, String adresse) async {

    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: motdepasse);
      User? user = result.user;

       //Create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).UpdateUserData(nom, prenom, email, telephone , motdepasse, adresse,user.uid);

      return user;
    }catch(e){

      print(e.toString());

      return null;
    }


  }


  // Sign in With email and password

  Future SignInWithEmailAndPassword(String email, String password) async {

    try{

      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password); 
      User? user = result.user;

      return user; 
    }catch(e){
      print(e.toString());
    }


  }

  // Sign out method

  Future Signout()async{
        try{

          return await _auth.signOut();

        }catch(e){

          print(e.toString());

          return null;
        }
  }

  currentUser() {}


}
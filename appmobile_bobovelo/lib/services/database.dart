import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({required this.uid});

  // Collection reference
  final CollectionReference utilisateurCollection = FirebaseFirestore.instance.collection('utilisateur');

  Future UpdateUserData(String prenom, String name, String email, String telephone, String password, String adresse, String userid) async {

    return await utilisateurCollection.doc(uid).set({
      'nom': name,
      'prenom': prenom,
      'email': email,
      'telephone': telephone,
      'password': password,
      'adresse': adresse,
      'id_user' : userid


    });
  }
}
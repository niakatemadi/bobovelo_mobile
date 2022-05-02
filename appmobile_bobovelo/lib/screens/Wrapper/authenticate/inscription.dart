import 'package:appmobile_bobovelo/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appmobile_bobovelo/services/auth.dart';
import 'package:provider/provider.dart';

class PageInscription extends StatefulWidget {
  const PageInscription({ Key? key }) : super(key: key);

  @override
  _PageInscriptionState createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {

  final _keyForm2= GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String nom='';
  String prenom='';
  String email='';
  String motdepasse='';
  String telephone='';
  String error='';
  String adresse='';

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User1?>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0.0,
        foregroundColor: Colors.black,
      ),
      body:SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue,Colors.white,Colors.white]
          )
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  height:200,
                  child: Image.asset('images/logovelo.png')
                ),
                const Text(
                  'Inscription',
                  style:TextStyle(
                    fontSize: 40
                  )
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Form(
                    key: _keyForm2,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Nom'),
                          validator: (val){
                            if(val=='' || val!.isEmpty){
                              return 'Entrez votre nom';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() => nom=val);
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Prénom'),
                          validator: (val){
                            if(val=='' || val!.isEmpty){
                              return 'Entrer votre prénom';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() =>  {
                              prenom=val
                            });
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: (val){
                            if(val=='' || val!.isEmpty){
                              return 'Entrer votre adresse email';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() => {
                              email=val
                            });
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText:'Mot de passe'),
                          validator: (val){
                            if(val=='' || val!.isEmpty){
                              return 'Entrer votre mot de passe';
                            }
                            return null;
                          },
                          onChanged: (val){
                            setState(() => {
                              motdepasse=val
                            });
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Téléphone'),
                          validator: (val){
                            if(val=='' || val!.isEmpty){
                              return 'Entrer votre numéro de téléphone';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() => {
                              telephone=val
                            });
                          },
                        ),
                         TextFormField(
                          decoration: const InputDecoration(labelText: 'Adresse'),
                          validator: (val){
                            if(val=='' || val!.isEmpty){
                              return 'Entrer votre adresse';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() => {
                              adresse=val
                            });
                          },
                        ),
                        const SizedBox(height:20),
                        ElevatedButton(
                          onPressed: () async {
                            if(_keyForm2.currentState!.validate()){
                              print('envoyer');
                              dynamic result = await _auth.registerWithEmailAndPassword(email,motdepasse,nom,prenom,telephone,adresse);

                              if(result == null){

                                setState(() {
                                  error = 'please enter a valid email';
                                });
                              }
                              else{
                                print('vous etes inscrit !');
                              }

                            }
                            
                          },
                          child: const Text("S'inscire maintenant"))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
      
    );
  }
}
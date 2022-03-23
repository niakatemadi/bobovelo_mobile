import 'package:appmobile_bobovelo/main.dart';
import 'package:appmobile_bobovelo/models/user.dart';
import 'package:appmobile_bobovelo/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
class UpdateBody extends StatefulWidget {
  const UpdateBody({ Key? key }) : super(key: key);

  @override
  State<UpdateBody> createState() => _UpdateBodyState();
}

class _UpdateBodyState extends State<UpdateBody> {

  final _keyform4 = GlobalKey<FormState>();
  

  String prenom ='';
  String nom ='';
  String adresse ='';
  String email ='';
  String telephone ='';
  String motdepasse ='';

  final Stream<QuerySnapshot> _utilisateurStream =
      FirebaseFirestore.instance.collection('utilisateur').snapshots();

  @override
  Widget build(BuildContext context) {

     final _user6 = Provider.of<User1?>(context);
    return StreamBuilder(
      stream:_utilisateurStream ,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

        if(snapshot.hasError){

          return const Text('Something went wrong !');
        }

        if(snapshot.connectionState== ConnectionState.waiting){

          return const Center(child:  Text('Loading...'));
        }

        return SingleChildScrollView(
          child: Column(
            children: snapshot.data!.docs.where( ( DocumentSnapshot<Object?> element) => element['id_user']==_user6!.uid).map((DocumentSnapshot document){
                Map<String, dynamic> utilisateur = 
                            document.data()! as Map<String, dynamic>  ;
        
                return Container(
          child: Form(
            key: _keyform4,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                    height: 450,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFormField(
                          decoration:  InputDecoration(
                            label: Text('prenom: '+utilisateur['prenom']),
                            filled:true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder()
                          ),
                          validator: (val){
                            if(val =='' || val!.isEmpty){
                              return 'Entrer un prénom ';
                            }
        
                            return null;
                          },
                          onChanged: (val){
                            setState(() {
                              prenom=val;
                            });
                          },
                        ),
                        TextFormField(
                          decoration:  InputDecoration(
                            label: Text('Nom :'+ utilisateur['nom'] ),
                            border: OutlineInputBorder()
                          ),
                          validator: (val){
                            if(val=='' || val!.isEmpty){
                              return 'Entrer un nom';
                            }
                            return null;
                          },
                          onChanged: (val){
                            setState(() {
                              nom=val;
                            });
                          },
                        ),
                        TextFormField(
                          decoration:  InputDecoration(
                            label: Text('adresse :'+utilisateur['adresse']),
                            border: OutlineInputBorder()
                          ),
                          validator: (val){
                            if(val=='' || val!.isEmpty){
                              return 'Entrer une adresse';
                            }
                            return null;
                          },
                          onChanged: (val){
                            setState(() {
                              adresse=val;
                            });
                          },
                        ),
                        TextFormField(
                          decoration:  InputDecoration(
                            label: Text('Téléphone: '+utilisateur['telephone']),
                            border: OutlineInputBorder()
                          ),
                          validator: (val){
                            if(val=='' || val!.isEmpty){
                              return 'Entrer un numéro de télephone';
                            }
                            return null;
                          },
                          onChanged: (val){
                            setState(() {
                              telephone=val;
                            });
                          },
                          
                        ),
                        TextFormField(
                          decoration:  InputDecoration(
                            label: Text('Email :'+ utilisateur['email']),
                            border: OutlineInputBorder()
                          ),
                          validator: (val){
                            if(val=='' || val!.isEmpty){
                              return 'Entrer un email';
                            }
                            return null;
                          },
                          onChanged: (val){
                            setState(() {
                              email=val;
                            });
                          },
                        ),
                        TextFormField(
                          decoration:  InputDecoration(
                            label: Text('Mot de passe: '+utilisateur['password']),
                            border: OutlineInputBorder()
                  
                          ),
                          validator: (val){
                            if(val=='' ||val!.isEmpty){
                              return 'Entrer un mot de passse';
                            }
                            return null;
                          },
                          onChanged: (val){
                            setState(() {
                              motdepasse=val;
                            });
                          },
                        )
                      ],
                    ),
                  ),SizedBox(height:20),
                  ElevatedButton(
                    onPressed: () async {
                      print(_user6!.uid);
                      if(_keyform4.currentState!.validate()){
                        
                        await DatabaseService(uid: _user6.uid).UpdateUserData(prenom, nom, email, telephone, motdepasse, adresse, _user6.uid);
                      }
                    },
                    child: const Text('Modifier'),
                  )
                ]),
            )),
              );
            }).toList() ,
          ),
        );
      }
    );
  }
}
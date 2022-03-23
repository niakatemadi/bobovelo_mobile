import 'package:appmobile_bobovelo/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:appmobile_bobovelo/shared/constants.dart';
import 'package:provider/provider.dart';
//import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/InsideHomePage/InsideServiceSection/liste_services.dart';
class DemandeService extends StatefulWidget {
  final currentIdService;
  const DemandeService({Key? key, required this.currentIdService }) : super(key: key);

  @override
  State<DemandeService> createState() => _DemandeServiceState();
}

class _DemandeServiceState extends State<DemandeService> {

    final _keyform5 = GlobalKey<FormState>();

    String sujetDemande = '';
    String description ='';
    String dateIntervention ='';
    String ville='';
    String adresse='';

    String idUtilisateur='';
    String idService='';
    String etat ='';
  @override
  Widget build(BuildContext context) {

    final _currentUser = Provider.of<User1?>(context);
    final _idUser=_currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Demande de service"),
      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Form(
            key: _keyform5,
            child: SingleChildScrollView(
              child: Container(
                height: 520,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sujet :', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400)),
                    TextFormField(
                      decoration: TextInputDecoration1,
                      validator: (val){
                        if(val=='' || val!.isEmpty){
                          return 'Entrer un sujet';
                        }
                        return null;
                      },
                      onChanged: (val){
                        setState(() {
                          sujetDemande=val;
                        });
                      },
                    ),
                    SizedBox(height:10),
                    Text('Description :', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400)),
                    TextFormField(
                      decoration: TextInputDecoration1,
                      validator: (val){
                        if(val=='' || val!.isEmpty){
                          return 'Entrer une description';
                        }
                        return null;
                      },
                      onChanged: (val){
                        setState(() {
                          description=val;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    Text('Ville :', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400)),
                    TextFormField(
                      decoration: TextInputDecoration1,
                      validator: (val){
                        if(val=='' || val!.isEmpty){
                          return 'Entrer une ville';
                        }
                        return null;
                      },
                      onChanged: (val){
                        setState(() {
                          ville=val;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    Text('Adresse :', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400)), 
                    TextFormField(
                      decoration: TextInputDecoration1,
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
                    Text('Date_intervention :', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400)),
                    SizedBox(height:20),
                    TextFormField(
                      decoration: TextInputDecoration1,
                      validator: (val){
                        if(val=='' || val!.isEmpty){
                          return 'Entrer une date d\'intervention ';
                        }
                        return null;
                      },
                      onChanged: (val){
                        setState(() {
                          dateIntervention=val;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: (){
                        FirebaseFirestore.instance.collection('demandes').add({
                                'sujet_demande' : sujetDemande,
                                'description' : description,
                                'id_service' : widget.currentIdService,
                                'date_intervention' : dateIntervention,
                                'ville' : ville,
                                'id_user' : _idUser,
                                'etat': 'Envoyée'
                              });
                        print('successfull2: '+ widget.currentIdService);
                        Navigator.pop(context);
                      },
                      child: const Text("Envoyer la demande"))],
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}
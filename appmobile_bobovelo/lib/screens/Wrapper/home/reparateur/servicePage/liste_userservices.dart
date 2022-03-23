import 'package:appmobile_bobovelo/models/user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({ Key? key }) : super(key: key);

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {

    final Stream<QuerySnapshot> _servicesStream =
      FirebaseFirestore.instance.collection('services').snapshots();

  @override
  Widget build(BuildContext context) {
    final _user10 = Provider.of<User1?>(context);
    return StreamBuilder<QuerySnapshot>(
      stream: _servicesStream ,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text("Loading"),
          );
        }
        
        return Column(
          children: snapshot.data!.docs.where( (DocumentSnapshot<Object?> element) => element['id_user']==_user10!.uid).map((DocumentSnapshot document) {
            
                      Map<String, dynamic> service = 
                          document.data()! as Map<String, dynamic>  ;

                  
                      return GestureDetector(
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      color: Colors.grey
                                    ),
                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            service['categorie'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20
                                            ),
                                          ),
                                          ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            service['titre'],
                                            style: TextStyle(
                                              fontSize: 15
                                            ),
                                          )),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                          child: Image.asset(
                                            'images/img_introduction.jpg',
                                          )
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(service['ville'],
                                          
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(service['description'])),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(service['rayon_intervention']+' Km')),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              service['tarif']+' €',
                                              style: const TextStyle(
                                                backgroundColor: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(onPressed: (){}, child: Text('Voir demandes'))
                                      ],
                                    ),
                                  )
                              ),);
          }).toList());
          }
    );
  }
}
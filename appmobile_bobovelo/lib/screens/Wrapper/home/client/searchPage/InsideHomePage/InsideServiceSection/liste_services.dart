import 'package:appmobile_bobovelo/models/user.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/InsideHomePage/InsideServiceSection/demande_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ServicesList extends StatefulWidget {
  const ServicesList({ Key? key }) : super(key: key);

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {

   final Stream<QuerySnapshot> _servicesStream =
      FirebaseFirestore.instance.collection('services').snapshots();

   
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User1?>(context);
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
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            
            Map<String, dynamic> service = 
                document.data()! as Map<String, dynamic>  ;
                print('inside service');
            String idService = document.id;

            print('service id '+ idService);
                return GestureDetector(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.grey
          ),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            children: [
               Align(
                alignment: Alignment.center,
                child: Text(
                  service['categorie'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                  ),
                ),
                ),
               Align(
                alignment: Alignment.topLeft,
                child: Text(
                  service['titre'],
                  style: const TextStyle(
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
                alignment: Alignment.topRight,
                child: Text(
                  service['tarif']+' €',
                  style: const TextStyle(
                    backgroundColor: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  DemandeService( currentIdService: idService))
                  );
                },
                child: const Text('Commander')
              )
            ],
          ),
        )
    ),);
          }).toList());
          }
    );
  }
}

import 'package:appmobile_bobovelo/models/user.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/InsideHomePage/appbar.dart';
import 'package:appmobile_bobovelo/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';


class ListeDemandesDeService extends StatefulWidget {

  final currentserviceid;
  const ListeDemandesDeService({Key? key, required this.currentserviceid }) : super(key: key);


  @override
  State<ListeDemandesDeService> createState() => _ListeDemandesDeServiceState();
}

class _ListeDemandesDeServiceState extends State<ListeDemandesDeService> {

  final Stream<QuerySnapshot> _demandeStream2 = FirebaseFirestore.instance.collection('demandes').snapshots();

  @override
  Widget build(BuildContext context) {

    final user99 = Provider.of<User1?>(context);
   

    return StreamBuilder<QuerySnapshot>(
      stream: _demandeStream2,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

        if(snapshot.hasError){
          return const Text('Something went wrong !');
        }

        if(snapshot.connectionState==ConnectionState.waiting){

          return const Center(
            child: Text('Loading..')
          );
        }
        
  return Column(
    children: snapshot.data!.docs.where( (DocumentSnapshot<Object?> element) => element['id_service'] == widget.currentserviceid  ).map((DocumentSnapshot document) {
            
            Map<String, dynamic> demande = 
                document.data()! as Map<String, dynamic>  ;

                String iddemande = document.id;

                 final CollectionReference demandesCollection = FirebaseFirestore.instance.collection('demandes');
               
            return Card(
              shadowColor: Colors.grey,
              borderOnForeground: true,
              color: demande['etat']=='acceptée' ? Colors.green : Colors.grey,
              child: Container(
                child: Row(
                  children: [Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Image.asset('images/img_introduction.jpg',
                    width: 150),
                  ),
                  Container(
                    width: 210,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey
                    ),
                    child: Column(
                      children: [
                        Text(
                          demande['sujet_demande'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        const Divider(height: 10, color: Colors.black, thickness: 2),
                        Align(
                          alignment : Alignment.bottomLeft,
                          child : Text(
                            'Sujet: '+demande['description'],
                            style: TextStyle(fontWeight: FontWeight.w500),)
                        ),
                        Align(
                          alignment : Alignment.bottomLeft,
                          child : Text('Pour le: '+
                            demande['date_intervention'],
                            style: TextStyle(fontWeight: FontWeight.w500),)
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(2, 4, 2, 4),
                              width: 100,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: ()  {
                                  setState(() async{
                                   await demandesCollection.doc(iddemande).update({
                                     'etat' : 'acceptée'

                                   });
                                  });
                                },
                                child: const Text('Accepter'),
                                
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(2, 4, 2, 4),
                              width: 100,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: (){
                                  setState(() async{
                                   await demandesCollection.doc(iddemande).update({
                                     'etat' : 'refusée'

                                   });
                                  });
                                },
                                child: const Text('refuser'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red
                                ),
                                
                              ),
                            )],
                        )
                      ],
                    ),
                  )],
                ),
              ),
            );
        
    }
    ).toList());

      }
    );
  }
}
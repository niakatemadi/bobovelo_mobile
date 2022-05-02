import 'package:appmobile_bobovelo/models/user.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/alerte_passage_reparateur_client.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/homepage.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/reparateur/servicePage/service_page.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/reparateur/updatePage/update_reparateur_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:appmobile_bobovelo/shared/constants.dart';
import 'package:provider/provider.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({ Key? key }) : super(key: key);

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {

  final _keyform3 = GlobalKey<FormState>();

  String titre = '';
  String description ='';
  String tarif = '';
  String rayon_intervention ='';
  String ville ='';
  String categorie ='';


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User1?>(context);
    return Scaffold(
      appBar: AppBar(
         leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              onPressed: (){
                Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => const PassageClientReparateur(repairorclient: ' Voulez-vous vraiment passer en mode client', client : false)
                            ),
                        );
              }, 
              icon: Icon(Icons.pedal_bike)
            );
          },
        ),
        centerTitle:true,
        title: const Text(
          'Ajouter un service'),
      ),
      body: Container(
        child: Form(
          key: _keyform3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 600,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column( 
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          TextFormField(
                            decoration: TextInputDecoration1.copyWith(label: Text('Titre')),
                            validator: (val){
                              if(val=='' || val!.isEmpty){
                                return 'Entrer un titre';
                              }

                              return null;
                            },
                            onChanged: (val){
                              setState(() {
                                titre=val;
                              });
                            },
                          ),
                          TextFormField(
                            decoration: TextInputDecoration1.copyWith(label: Text('Description')),
                            validator: (val){

                              if( val=='' || val!.isEmpty){
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
                          TextFormField(
                            decoration: TextInputDecoration1.copyWith(label: Text('Tarif')),
                            validator: (val){

                              if( val=='' || val!.isEmpty){
                                return 'Entrer un tarif';
                              }

                              return null;

                            },
                            onChanged: (val){
                              setState(() {
                                tarif=val;
                              });
                            },
                          ),
                          TextFormField(
                            decoration: TextInputDecoration1.copyWith(label: Text("Rayon d'intervention")),
                            validator: (val){
                              if( val=='' || val!.isEmpty){
                                return 'Entrer un rayon d\'intervention';
                              }

                              return null;
                            },
                            onChanged: (val){
                              setState(() {
                                rayon_intervention=val;
                              });
                            },
                          ),
                          TextFormField(
                            decoration: TextInputDecoration1.copyWith(label: Text('Ville')),
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
                          TextFormField(
                            decoration: TextInputDecoration1.copyWith(label: Text('Catégorie')),
                            validator: (val){
                              if(val=='' || val!.isEmpty){
                                return 'Entrer une catégorie';
                              }

                              return null;
                            },
                            onChanged: (val){
                              setState(() {
                                categorie=val;
                              });
                            },

                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(50)
                            ),
                            onPressed: (){

                            if(_keyform3.currentState!.validate()){
                              FirebaseFirestore.instance.collection('services').add({
                                'titre' : titre,
                                'description' : description,
                                'tarif' : tarif,
                                'rayon_intervention' : rayon_intervention,
                                'ville' : ville,
                                'categorie' : categorie,
                                'id_user' : user!.uid
                              });
                              Navigator.pop(context);
                            }
                          }, child: Text('Ajouter ce service'))
                      
                        ],
                  )
                ),
              ],
            ),
          ),
        ),
      ) ,
      bottomNavigationBar: BottomReparateur(),
    );
  }
}

class BottomReparateur extends StatelessWidget {
  const BottomReparateur({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
          child: Container(
            height:58,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => const UpdateRepairPage(),
                          ),
                        );
                  },
                  icon: const Icon(Icons.person),
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.search
                  ),
                  iconSize: 30,
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: (){
                    Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => const ServicePage(),
                          ),
                    );
                  },
                  icon: const Icon(Icons.home_repair_service),
                  iconSize: 30,
                )
              ]
            )
          ),
        );
  }
}

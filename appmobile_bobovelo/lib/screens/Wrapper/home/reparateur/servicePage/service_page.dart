import 'package:appmobile_bobovelo/screens/Wrapper/home/reparateur/updatePage/update_reparateur_page.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/reparateur/addServicePage/add_service_page.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/reparateur/servicePage/liste_userservices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({ Key? key }) : super(key: key);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Mes services'),
      ),
      body: Container(
        width: 393,
        child: Column(
          children: [
             Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [ServiceList()] ,
              ),
            ),
          )
            ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height:58,
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
                onPressed: (){
                  Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => const AddServicePage(),
                          ),
                        );
                },
                icon: const Icon(Icons.search),
                iconSize: 30,
                
              ),
              IconButton(
                onPressed: (){
                  Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => const ServicePage(),
                          ),
                        );
                }, icon: const Icon(Icons.home_repair_service)
              )
            ],
          ),
        ) ,
      ),
    );
  }
}

// Creation d'une card pour les services

class ServiceCard extends StatelessWidget {

  final Map servicedata;
  ServiceCard(this.servicedata); 


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      height:200,
      color: Colors.purple,
      
    );
  }
}
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/demandePage/liste_demandes.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/homepage.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/updatePage/update_page.dart';
import 'package:flutter/material.dart';

class DemandePage extends StatefulWidget {
  const DemandePage({ Key? key }) : super(key: key);

  @override
  _DemandePageState createState() => _DemandePageState();
}

class _DemandePageState extends State<DemandePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Mes demandes'),
      ),
      body: Container(
        color: Colors.white,
        width: 393,
        child: Column(
          children: [
             Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [DemandeList()],
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
                            builder: (context) => const UpdatePage(),
                          ),
                        );
                }, 
                icon: const Icon(Icons.person),
                iconSize: 30),
              IconButton(
                onPressed: (){
                  Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                }, 
                icon: const Icon(Icons.search),
                iconSize: 30
              ),
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.home_repair_service),
                color: Colors.blue,
                iconSize: 30,              )
            ],
          ),
        ) ,
      ),
    );
  }
}

// Creation d'une card pour les services

class DemandeCard extends StatelessWidget {

  final Map demandedata;
  DemandeCard(this.demandedata); 


  @override
  Widget build(BuildContext context) {
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
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Titre',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                  ),
                ),
                ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'sujet demande',
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
              const Align(
                alignment: Alignment.topLeft,
                child: Text('ville',
                
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('description')),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('Date')),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Commande acceptée',
                  style: TextStyle(backgroundColor: Colors.green),
                ),
              )
            ],
          ),
        )
    ),);
  }
}
/*
Container(
          child: Column(
            children: [
              Text('Ville'),
              Text('Date'),
              Text('Commande acceptée !', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w500, fontSize: 20),)
            ]
          ),
        )*/
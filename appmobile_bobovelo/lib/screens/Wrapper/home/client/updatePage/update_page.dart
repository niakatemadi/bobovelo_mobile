import 'package:appmobile_bobovelo/models/user.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/demandePage/demande_page.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/homepage.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/updatePage/update_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appmobile_bobovelo/services/database.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({ Key? key }) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
       centerTitle: true,
        title: const Text(
          'Informations personnelles',
          style:TextStyle(color: Colors.white)),
      ),
      body: UpdateBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 58,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.person),
                color: Colors.blue,
                iconSize: 30,              ),
              IconButton(
                onPressed: (){
                  Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
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
                            builder: (context) => const DemandePage(),
                          ),
                        );
                },
                icon: const Icon(Icons.home_repair_service),
                iconSize: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
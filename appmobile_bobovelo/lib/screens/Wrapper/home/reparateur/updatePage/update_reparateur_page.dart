import 'package:appmobile_bobovelo/screens/Wrapper/home/reparateur/addServicePage/add_service_page.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/reparateur/servicePage/service_page.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/reparateur/updatePage/update_reparateur_body.dart';
import 'package:flutter/material.dart';
class UpdateRepairPage extends StatefulWidget {
  const UpdateRepairPage({ Key? key }) : super(key: key);

  @override
  _UpdateRepairPageState createState() => _UpdateRepairPageState();
}

class _UpdateRepairPageState extends State<UpdateRepairPage> {
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
      body: UpdateReparateurBody(),
      bottomNavigationBar:  BottomAppBar(
        child: Container(
          height: 58,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.person),
                color: Colors.blue,
                iconSize: 30
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
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/homepage.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/reparateur/addServicePage/add_service_page.dart';
import 'package:flutter/material.dart';

class PassageClientReparateur extends StatefulWidget {
   final repairorclient;
   final client;
  const PassageClientReparateur({Key? key, required this.repairorclient, required this.client }) : super(key: key);

  @override
  State<PassageClientReparateur> createState() => _PassageClientReparateurState();
}

class _PassageClientReparateurState extends State<PassageClientReparateur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            color: Colors.black,
            height: 100,
            width: 400,
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Column(
              children: [
                Align( alignment: Alignment.center,child: Text(widget.repairorclient, style: TextStyle(color: Colors.white),)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  ElevatedButton(
                    onPressed: (){
                       Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => const AddServicePage()
                            ),
                        );
                    },
                    child: widget.client? Text('Oui') : Text('Non')
                  ),
                  ElevatedButton(
                    onPressed: (){
                       Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => HomePage()
                            ),
                );
                    },
                    child: widget.client? Text('Non') : Text('Oui')
                  )
                ],
                )
              ],
            ),
        ),
    ),
      ));
  }
}
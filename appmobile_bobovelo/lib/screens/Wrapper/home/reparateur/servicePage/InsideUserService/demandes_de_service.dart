import 'package:appmobile_bobovelo/screens/Wrapper/home/reparateur/servicePage/InsideUserService/liste_demandes_de_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemandesDeService extends StatelessWidget {

  final myidservice;
  const DemandesDeService({Key? key, required this.myidservice }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Demandes de service'),
      ),
      body: Container(
          child: Column(
            children: [ListeDemandesDeService(currentserviceid: myidservice)],
          )
      )
    );
  }
}
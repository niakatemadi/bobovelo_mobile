import 'package:appmobile_bobovelo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/reparateur/addServicePage/add_service_page.dart';

class MyAppBar1 extends StatelessWidget{

   final AuthService _auth = AuthService(); 

  @override
  Widget build(BuildContext context) {
    return  AppBar(
          centerTitle: true,
          title: const Text(
            'Bobovelo',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.end,),
          backgroundColor: Colors.white,
          actions: <Widget>[
            TextButton.icon(
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.red)),
              icon: const Icon(Icons.logout_outlined),
              label: const Text('Déconnexion'),
              onPressed: ()async{

                dynamic result = await _auth.Signout();

                if(result==null){
                  print('Error signing out !');
                }else{
                  print('Sign out succeed !');
                }
                

              },)
          ],
          leading: IconButton(
            onPressed: (){
              Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => const AddServicePage()
                          ),
              );
            },
            icon: const Icon(
              Icons.build_rounded,
              color:Colors.black
            )
          ),
        );
  }


}
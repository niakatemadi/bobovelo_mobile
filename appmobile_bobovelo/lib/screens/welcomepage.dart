import 'package:appmobile_bobovelo/screens/Wrapper/authenticate/connexion.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 380,
                height:180,
                child: Image.asset(
                  'images/logovelo.png',
                  height:150
                )
              ),
              Container(
                width: 330,
                height:420,
                child: Image.asset(
                  'images/welcomepage.jpg',
                  fit: BoxFit.fill,
                  
                )
              ),
              const Text(
                'Bienvenue chez Bobovelo France !',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
                )
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => const PageConnexion(),
                          ),
                        );
                },
                child: const Text('Découvrir Bobovelo'),
                style: ButtonStyle(
                   foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                   backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                   
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
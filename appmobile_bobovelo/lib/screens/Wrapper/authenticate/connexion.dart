import 'package:appmobile_bobovelo/screens/Wrapper/authenticate/inscription.dart';
import 'package:flutter/material.dart';
import 'package:appmobile_bobovelo/shared/constants.dart';
import 'package:appmobile_bobovelo/services/auth.dart';
import 'package:appmobile_bobovelo/shared/loading.dart';
class PageConnexion extends StatefulWidget {
  const PageConnexion({ Key? key }) : super(key: key);

  @override
  _PageConnexionState createState() => _PageConnexionState();
}

class _PageConnexionState extends State<PageConnexion> {

  final AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();

  String email = '';
  String motdepasse = '';
  String error='';
  bool loading=false;
  bool _passwordVisibility=false;
  

  @override
  Widget build(BuildContext context) {

    return loading? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Center(
          child: Column(
            children:  [
              Container(
                height:200,
                child: Image.asset('images/logovelo.png')
              ),
              const Text(
                'Bienvenue',
                style: TextStyle(
                  fontSize: 40
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: TextInputDecoration1.copyWith(hintText:'Email'),
                          validator: (val)  {
                            if (val=='' || val!.isEmpty){
                              return 'Enter your email !';
                            }
                            return null;
                          },
                          onChanged: (val){
                            setState(() => email=val);
                          },
                        ),
                        TextFormField(
                          decoration:  InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: const TextStyle(
                              color: Colors.black
                            ),
                            hintText: 'Mot de passe',                       
                            border: OutlineInputBorder(),                         
                            suffixIcon: IconButton(
                              icon: Icon(_passwordVisibility ?Icons.visibility : Icons.visibility_off),
                              onPressed: (){

                                setState(() {
                                  _passwordVisibility = !_passwordVisibility;
                                });
                              },
                            )
                          ),
                          validator: (val){
                            if( val=='' || val!.isEmpty){
                              return 'Please enter your password !';
                            }
                            return null;
                          },
                          onChanged: (val){ setState( ()=> motdepasse=val);},
                          obscureText: _passwordVisibility,
                        )
                      ],
                    )
                )
              ),
              ElevatedButton(
                onPressed: ()async{
                  if(_formKey.currentState!.validate()){
                    
                    setState( (){ loading=true; });
                    dynamic result = await _auth.SignInWithEmailAndPassword(email, motdepasse);
                    if(result == null){
                      setState(() {
                        error = 'Please enter a valid email';
                        loading=false;
                      });
                    }else{
                      print('you are connected!');
                      error='';
                      setState( (){
                        loading=false;
                      });
                    }             
                  }
                },
                child: const Text(
                  'Se connecter'
                )
              ),
              const SizedBox(height:30),
              Container(
                padding: const EdgeInsets.fromLTRB(60, 0, 0, 60),
                child: Row(
                  children: [
                    const Text("vous n'avez pas encore de compte?"),
                    TextButton(onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => PageInscription()
                          ),
                      );
                    }, child: const Text("S'inscrire"))],
                ),
              ),
              Container(
                child: Text(error,
                style: const TextStyle(color:Colors.red),)
              )
            
            ],
          ),
        ),
      )
    );
  }
}

class TextInputDecoration {
}
import 'package:appmobile_bobovelo/screens/Wrapper/authenticate/connexion.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:appmobile_bobovelo/models/user.dart';
import 'package:provider/provider.dart';

class WrapperPage extends StatelessWidget {
  const WrapperPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User1?>(context);
     if(user == null){
       return PageConnexion();
    }else{
      return HomePage();
    }
  }
}

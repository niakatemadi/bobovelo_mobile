import 'package:appmobile_bobovelo/models/user.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/authenticate/connexion.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/authenticate/inscription.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/wrapper.dart';
import 'package:appmobile_bobovelo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:appmobile_bobovelo/screens/welcomepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
const d_green= Color(0xFF54D3c2);
void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
 //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User1?>.value(
      value: AuthService().user,
      catchError:(User,User1) => null,
      initialData:null,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: WrapperPage(),
      ),
    );
  }
}

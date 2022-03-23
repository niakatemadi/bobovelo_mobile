import 'package:appmobile_bobovelo/screens/Wrapper/home/client/demandePage/demande_page.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/InsideHomePage/appbar.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/InsideHomePage/service_section.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/InsideHomePage/search_section.dart';
import 'package:appmobile_bobovelo/screens/Wrapper/home/client/updatePage/update_page.dart';
import 'package:appmobile_bobovelo/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: MyAppBar1(),
        ),
        body: Container(
          child: Column(
            children: [
              SearchSection(),
              HotelSection()
            ],
          )
        ),
        bottomNavigationBar: const Bottom()
      );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
          child: Container(
            height:58,
            color: Colors.white,
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
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.search
                  ),
                  iconSize: 30,
                  color: Colors.blue,
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
              ]
            )
          ),
        );
  }
}

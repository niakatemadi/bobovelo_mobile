import 'package:flutter/material.dart';
import 'package:appmobile_bobovelo/main.dart';

import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/InsideHomePage/InsideServiceSection/liste_services.dart';
class HotelSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height:530,
      padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: Column(
        children: [
          Container(
            height:60,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height:50,
                  width:150,
                  color: Colors.white,
                  child: const Center(
                    child: Text('5 services trouvée')
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const Text('Filtres'),
                      Container(
                        height: 40,
                        width: 45,  
                        child: IconButton(
                          onPressed: (){},
                          icon: const Icon( 
                            Icons.filter_list_outlined,
                            color: Colors.blue,
                            )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [ServicesList()]
              ),
            ),
          )
        ],
      ),
    );
  }
}


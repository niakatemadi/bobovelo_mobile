import 'package:flutter/material.dart';
import 'package:appmobile_bobovelo/main.dart';

import 'package:appmobile_bobovelo/screens/Wrapper/home/client/searchPage/InsideHomePage/InsideServiceSection/liste_services.dart';
class HotelSection extends StatefulWidget {

  @override
  State<HotelSection> createState() => _HotelSectionState();
}

class _HotelSectionState extends State<HotelSection> {
  final d_grey = const Color.fromARGB(230, 230, 230, 230);

  final _formsearchedkey = GlobalKey<FormState>();

  String villesearched = '';

  String sentvillesearched ='';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Form(
        key: _formsearchedkey,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: d_grey,
          ),
          child: Row(
      
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height:60,
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled:true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                    )
                  ),
                  onChanged: (val) => {
                    villesearched = val
                  },
                  validator: (val) {
                    if(val =='' || val!.isEmpty){
                      return 'Entrer une ville';
                    }
                    return null;
                  },
                )
              ),
              Container(
                height:60,
                width:60,
                child: ElevatedButton(
                  onPressed: (){
                    if(_formsearchedkey.currentState!.validate())
                    {
                      setState ( () {
                        sentvillesearched = villesearched;
                      });
                
                    }
                  },
                  child: const Icon( Icons.search),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>( 
                      const RoundedRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(50)
                         ),
                      )
                    ),
                ),
              )
              )],
          )
        ),
      ) ,Container(
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
                  children: [ServicesList(repairville: sentvillesearched)]
                ),
              ),
            )
          ],
        ),
      )],
    );
  }
}


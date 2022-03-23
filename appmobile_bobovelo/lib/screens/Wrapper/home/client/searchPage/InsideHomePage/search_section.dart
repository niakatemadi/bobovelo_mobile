import 'package:appmobile_bobovelo/main.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
   SearchSection({ Key? key }) : super(key: key);

  final d_grey = Color.fromARGB(230, 230, 230, 230);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
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
                  )
                ),
                Container(
                  height:60,
                  width:60,
                  child: ElevatedButton(
                    onPressed: (){},
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
         
        ],
      )
      
    );
  }
}
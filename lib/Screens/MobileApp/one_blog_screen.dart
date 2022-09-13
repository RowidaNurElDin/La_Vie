
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Cubit/lavie_states.dart';
import 'package:la_vie/Models/blog_model.dart';

import '../../Components.dart';
import 'blog_screen.dart';

class OneBlogScreen extends StatelessWidget {

  BlogPlants? plant ;

  OneBlogScreen({@required this.plant});


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back , color: Colors.black,),
          onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>  BlogScreen()));},
        ),
      ) ,

        body:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
                child:  plant!.imageUrl != "" ?
                Container(child:Image.network("https://lavie.orangedigitalcenteregypt.com${plant!.imageUrl!}", fit: BoxFit.fitWidth,),)
                : Container(width: 55, child: Image.asset('assets/empty.png'))),
            Container(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Container(
                          child: Text(plant!.name! ,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25
                            ),
                          ),
                        ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(plant!.description! ,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
                                  color: Colors.grey[500]

                              ),
                              //overflow: TextOverflow.fade,

                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),

            ),

          ],
        )
    );
  }

}


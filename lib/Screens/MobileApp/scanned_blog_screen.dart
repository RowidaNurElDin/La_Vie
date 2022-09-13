
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Cubit/lavie_states.dart';
import 'package:la_vie/Models/blog_model.dart';
import 'package:la_vie/Screens/MobileApp/home_screen.dart';

import '../../Components.dart';
import 'blog_screen.dart';

class ScannedBlogScreen extends StatelessWidget {

  BlogPlants? plant ;
  ScannedBlogScreen({@required this.plant});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back , color: Colors.black,),
            onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>  MobileHome()));},
          ),
        ) ,

        body: Column(
          children: [
            Container(
              height: 250,
              child: Stack(
                    children: [
                     Container(
                       decoration: BoxDecoration(
                         color: Colors.black.withOpacity(0.8),
                         image: DecorationImage(
                           fit: BoxFit.fitWidth,
                           image: plant!.imageUrl != "" ? NetworkImage("https://lavie.orangedigitalcenteregypt.com${plant!.imageUrl!}") :
                           NetworkImage("https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg"),
                           colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2),
                               BlendMode.dstATop)
                       ),
                     ),),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0 , top: 16),
                        child: Column(
                          children: [
                            Components.scannedPlantData(plant!.sunLight.toString(), "Sun Light" , Icons.wb_sunny_outlined ),
                            Components.scannedPlantData(plant!.waterCapacity.toString(), "Water Capacity" , Icons.water_drop ),
                            Components.scannedPlantData(plant!.temperature.toString(), "Tempreature" , Icons.thermostat_rounded),
                          ],
                        ),
                      ),
                ],
              ),
            ),
            Container(
              height: 401,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
              ),
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
        ),

    );
  }

}

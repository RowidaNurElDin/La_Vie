import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Components.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Cubit/lavie_states.dart';

import 'home_screen.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, LaVieStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => MobileHome()));
              },
            ),
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: 420,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: NetworkImage(userimage??"https://cdn0.iconfinder.com/data/icons/set-ui-app-android/32/8-512.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: new BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.white.withOpacity(0.0)),
                      ),
                    ),
                  ),
                  Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      child: Image.network(userimage??"https://cdn0.iconfinder.com/data/icons/set-ui-app-android/32/8-512.png"),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    radius: 100,

                  ))
                ],
              ),
              Text(
                username??"user", style: TextStyle(
                fontSize: 25 ,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft : Radius.circular(40) , topRight: Radius.circular(40)),
                    color: Colors.white,
                    border: Border.all(color: Colors.white , width: 4)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            color: Colors.lightGreenAccent[100],
                          width: 500,
                          height: 80,
                          child: Center(child: Text('You have 30 points'  ,
                            style:TextStyle(
                              fontSize: 20
                            ),)),
                          ),
                      ),
                      SizedBox(height: 30),

                      MaterialButton(
                        onPressed: (){},
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color : Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200]
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Change Name", style: TextStyle(
                                  fontSize: 20
                                ),),
                                Icon(Icons.arrow_right_alt_sharp , size: 30,)
                              ],
                            ),
                          )),
                        ),
                      ),
                      SizedBox(height: 30),
                      MaterialButton(
                        onPressed: (){},
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              border: Border.all(color : Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[200]
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Change Email", style: TextStyle(
                                    fontSize: 20
                                ),),
                                Icon(Icons.arrow_right_alt_sharp , size: 30,)
                              ],
                            ),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

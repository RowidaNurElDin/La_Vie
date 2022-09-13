
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Cubit/lavie_states.dart';

import '../../Components.dart';
import 'home_screen.dart';

class BlogScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogCubit , LaVieStates>(
        listener: (context , states){},
        builder: (context , states){
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back , color: Colors.black,),
                  onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) =>  MobileHome()));},
                ),
                title: Center(
                  child: Text("Blogs",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              body: ListView.separated(
                  itemBuilder: (context, index) =>Components.blogTile(context , BlogCubit.get(context).blogPlants[index]),
                  separatorBuilder: (context, index) => Container(),
                  itemCount: BlogCubit.get(context).blogPlants.length),

          );
        });
  }
}

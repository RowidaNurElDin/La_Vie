import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Cubit/lavie_states.dart';
import 'package:la_vie/Models/product_model.dart';
import 'package:la_vie/Components.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MobileHome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<HomeCubit, LaVieStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
            backgroundColor: Colors.white,

            bottomNavigationBar: CurvedNavigationBar(
              color: Colors.grey[100]!,
              buttonBackgroundColor: Colors.green,
              backgroundColor: Colors.white38,
              index: HomeCubit.get(context).activePage,
              items: <Widget>[
                SvgPicture.asset('assets/leave.svg',
                  color: Colors.black,
                  height: 40.0,
                  width: 40.0,
                  allowDrawingOutsideViewBox: true,),
                SvgPicture.asset('assets/qrcode.svg',
                    color: Colors.black,
                    height: 30.0,
                    width: 30.0,
                    allowDrawingOutsideViewBox: true),
                Icon(Icons.home_outlined , size: 40,),
                SvgPicture.asset('assets/notif.svg',
                    color: Colors.black,
                    height: 40.0,
                    width: 40.0,
                    allowDrawingOutsideViewBox: true),
                Icon(Icons.person_rounded , size: 40,)
              ],
              onTap: (index) {

                HomeCubit.get(context).changeIndex(index);
               // print(HomeCubit.get(context).activePage );

              },
            ),


            body: HomeCubit.get(context).bottomNavScreens[HomeCubit.get(context).activePage] ,
          );
        },
      );
  }
}

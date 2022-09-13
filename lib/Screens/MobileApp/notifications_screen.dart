import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Cubit/lavie_states.dart';

import '../../Components.dart';

class NotificationScreen extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      return BlocConsumer<HomeCubit, LaVieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Center(
                child: Text("Notifications",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            body:  ListView.separated(
                  itemBuilder: (context, index) => Components.notificationTile(),
                  separatorBuilder: (context, index) => Divider(
                        indent: 20.0,
                        endIndent: 10.0,
                        thickness: 1,
                      ),
                  itemCount: 6),

          ) ;
        },
      );
    }
}

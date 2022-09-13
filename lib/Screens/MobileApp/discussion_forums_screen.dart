import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Components.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Cubit/lavie_states.dart';

import 'create_post_screen.dart';
import 'home_screen.dart';

class DiscussionForumsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DiscussionForumsCubit.get(context).getAllForums();
    DiscussionForumsCubit.get(context).getMyForums();

    return BlocConsumer<DiscussionForumsCubit, LaVieStates>(
        listener: (context , states){} ,
      builder: (context, states) {
          return Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(

              title: Center(
                child: Text("Discussion Forums",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back , color: Colors.black,),
                onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>  MobileHome()));},
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>  CreatePostScreen()));
              },
              backgroundColor: Colors.green,
              child: Icon(Icons.add , color: Colors.white,),

            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Components.searchBar(DiscussionForumsCubit.get(context).forumsSearchController , context),
                  SizedBox(height: 10,),
                  DefaultTabController(
                      length: 2,
                      child: Expanded(
                        child: Column(
                          children: [
                            Container(
                              child: TabBar(
                                unselectedLabelColor: Colors.grey,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green),
                                tabs: [
                                  Components.forumsTag('All forums'),
                                  Components.forumsTag('My forums')

                                ],
                              ),
                            ),
                            Expanded(child: TabBarView(
                              children: [
                                ListView.separated(
                                      itemBuilder: (context, index) => Components.forumTile(
                                        DiscussionForumsCubit.get(context).allForumsModel.data[index] , context
                                      ),
                                      separatorBuilder: (context, index) => Container(),
                                      itemCount: DiscussionForumsCubit.get(context).allForumsModel.data.length),
                                ListView.separated(
                                    itemBuilder: (context, index) => Components.forumTile(
                                        DiscussionForumsCubit.get(context).myForumsModel.data[index] , context
                                    ),
                                    separatorBuilder: (context, index) => Container(),
                                    itemCount: DiscussionForumsCubit.get(context).myForumsModel.data.length),
                              ],
                            ))
                          ],
                        ),
                      ))

                ],
              ),
            ),

          );
      }
    );
  }
}

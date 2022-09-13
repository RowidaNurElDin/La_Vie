import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Components.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Cubit/lavie_states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie/Screens/MobileApp/discussion_forums_screen.dart';

class CreatePostScreen extends StatelessWidget {

  @override

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiscussionForumsCubit, LaVieStates>(
        listener: (context , states){} ,
        builder: (context, states) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back , color: Colors.black,),
                onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>  DiscussionForumsScreen()));},
              ),
              title: Center(
                child: Text("Create Post",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 170,
                      height: 180,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DiscussionForumsCubit.get(context).imageFuture == null ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                            MaterialButton(
                              onPressed: (){
                                DiscussionForumsCubit.get(context).pickImage();
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:60.0),
                                    child: Icon(Icons.add , size: 30, color: Colors.green,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Add photo" , style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      color: Colors.green
                                    ),),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                          : Image.file(File(DiscussionForumsCubit.get(context).imageFuture!)),
                    ),
                    SizedBox(height: 20,),

                    Align(alignment: Alignment.topLeft,child: Components.myText('Title')),
                    Components.myTextField(DiscussionForumsCubit.get(context).titleController),
                    Align(alignment: Alignment.topLeft,child: Components.myText('Description')),
                    Padding(
                       padding: const EdgeInsets.symmetric(vertical: 15.0),
                       child: TextField(
                    controller: DiscussionForumsCubit.get(context).descriptionController,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 90.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(7.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey[500]!, width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7.0),
                          ),
                        )),
                  ),
                ),
                    Components.myButton('Post', (){
                      DiscussionForumsCubit.get(context).postForum(
                          DiscussionForumsCubit.get(context).titleController.text,
                          DiscussionForumsCubit.get(context).descriptionController.text,
                          DiscussionForumsCubit.get(context).imageFuture!, context);
                    })
                  ],

                ),
              ),
            ),


          );
        }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Cubit/lavie_states.dart';
import 'package:la_vie/Components.dart';

import 'home_screen.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, LaVieStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back , color: Colors.black,),
                onPressed: (){

                  ProductsCubit.get(context).searchController.clear();
                  ProductsCubit.get(context).showedSearchResults.clear();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>  MobileHome()));},
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: ProductsCubit.get(context).searchController,
                      onChanged: (value) {
                        ProductsCubit.get(context).showedSearchResults.clear();
                        ProductsCubit.get(context).searchProducts(value, context);
                      },
                      onSubmitted: (value){
                        print(value);
                        ProductsCubit.get(context).searchController.clear();
                        ProductsCubit.get(context).saveRecentSearch(value);
                        ProductsCubit.get(context).showedSearchResults.clear();
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          fillColor: Colors.grey[200],
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[200]!, width: 1.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          )),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>

                        ProductsCubit.get(context).showedSearchResults.length == 0 ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ProductsCubit.get(context).recentSearch[index],
                                ) :
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ProductsCubit.get(context)
                                  .showedSearchResults[index],
                            ) ,
                        separatorBuilder: (context, index) => Container(),
                        itemCount: ProductsCubit.get(context).showedSearchResults.length == 0?
                        ProductsCubit.get(context).recentSearch.length :
                        ProductsCubit.get(context).showedSearchResults.length),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

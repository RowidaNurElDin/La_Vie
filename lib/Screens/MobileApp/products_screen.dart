import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Cubit/lavie_states.dart';
import 'package:la_vie/Screens/MobileApp/blog_screen.dart';
import 'package:la_vie/Screens/MobileApp/search_screen.dart';

import '../../Components.dart';
import 'cart_screen.dart';

class ProductsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    print(token);

    return BlocConsumer<ProductsCubit,LaVieStates>(
        listener: (context,states){},
        builder: (context , states){

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70,),
                Center(
                  child: Components.mobileLogo(),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (BuildContext context) => SearchScreen()));
                                },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                               borderRadius:BorderRadius.all(Radius.circular(25.0)),
                               border: Border.all(color: Colors.grey[200]!),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(alignment: Alignment.centerLeft , child: Icon(Icons.search , color: Colors.grey,)),
                            ),
                          ),
                        )
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) =>  CartScreen()));
                          },
                          child: Center(
                            child: Icon(
                              Icons.shopping_cart_outlined,
                            ),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.green[500]!))))),
                    ),
                    SizedBox(width: 5,),
                    Container(
                      width: 50,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => BlogScreen()));
                          },
                          child: Center(
                            child: Icon(
                              Icons.article_outlined,
                            ),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.green[500]!))))),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                DefaultTabController(
                    length: 4,
                    child: Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.green, width: 2),
                              ),
                              tabs: [
                                Tab(child: Components.tags("All")),
                                Tab(child: Components.tags("Plants")),
                                Tab(child: Components.tags("Seeds")),
                                Tab(child: Components.tags("Tools"))
                              ],
                            ),
                          ),
                          Expanded(child: TabBarView(
                            children: [
                              Components.productsGrid(
                                  context,
                                  ProductsCubit.get(context).allProducts.length ,
                                  ProductsCubit.get(context).allProducts),
                              Components.productsGrid(
                                  context,
                                  ProductsCubit.get(context).allPlants.length ,
                                  ProductsCubit.get(context).allPlants),
                              Components.productsGrid(
                                  context,
                                  ProductsCubit.get(context).allSeeds.length ,
                                  ProductsCubit.get(context).allSeeds),
                              Components.productsGrid(
                                  context,
                                  ProductsCubit.get(context).allTools.length ,
                                  ProductsCubit.get(context).allTools),

                            ],
                          ))
                        ],
                      ),
                    ))
              ],
            ),
          );
        }
    );
  }
}



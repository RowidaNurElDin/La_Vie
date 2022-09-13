import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Components.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Cubit/lavie_states.dart';
import 'package:la_vie/Screens/Website/home.dart';

import 'home_screen.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit , LaVieStates>(
        listener: (context , states){},
        builder: (context , states){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Center(
                child: Text("My Cart",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
              ),
              leading: IconButton(icon: Icon(Icons.arrow_back , color: Colors.black,), onPressed: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return MobileHome();
                    }));
              },)
            ),
            body: ProductsCubit.get(context).cartProducts.length == 0 ? Components.cartIsEmpty() :
            Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => Components.cartTile(
                        context , ProductsCubit.get(context).cartProducts[index]
                      ),
                      separatorBuilder: (context, index) => Container(),
                      itemCount: ProductsCubit.get(context).cartProducts.length),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total" , style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto'
                      ),),
                      Text(ProductsCubit.get(context).totalPrice.toString() + " EGP" ,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto',
                          color: Colors.green
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Components.myButton('Checkout', (){
                    ProductsCubit.get(context).checkOut(context);



                  }),
                )
              ],
            )
          );
        });
  }
}

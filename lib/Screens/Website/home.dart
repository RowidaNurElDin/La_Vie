import 'package:flutter/material.dart';
//import 'package:just_the_tooltip/just_the_tooltip.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top :60.0 , right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Stack(
                    children: [
                      Container(
                        width: 500,
                        height: 500,
                        child: Image.asset('assets/tree.png'),
                      ),
                      Container(
                        width: 600,
                        height: 500,
                        child: Image.asset('assets/ellipse.png'),
                      ),


                    ],
                  ),
                  //TREE

                  Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 40),
                      //   child: JustTheTooltip(
                      //     child: Material(
                      //       color: Colors.grey.shade800,
                      //       shape: const CircleBorder(),
                      //       elevation: 4.0,
                      //       child: const Padding(
                      //         padding: EdgeInsets.all(8.0),
                      //         child: Icon(
                      //           Icons.add,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ),
                      //     content: const Padding(
                      //       padding: EdgeInsets.all(8.0),
                      //       child: Text(
                      //           'message'
                      //       ),
                      //     ),
                      //   )
                      // ),
                      Container(
                        width: 600,
                        //height: 200,
                        child: Text(
                          "Perfect way to plant in house",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 38,
                            fontWeight: FontWeight.w600,
                            color: Colors.green
                          ),

                        ),
                      ),
                      Container(
                        width: 600,
                        height: 200,
                        child: Text(
                          "leaf, in botany, any usually flattened green outgrowth from the stem of a vascular plant. As the primary sites of photosynthesis, leaves manufacture food for plants, which in turn ultimately nourish and sustain all land animals.",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 20,
                              color: Colors.grey[500]
                          ),

                        ),
                      ),
                    ],
                  )

                ],
              )
            ],
          ),
        ),
      ),



    );
  }
}
//

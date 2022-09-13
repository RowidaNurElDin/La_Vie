import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Models/blog_model.dart';
import 'package:la_vie/Models/exam_model.dart';
import 'package:la_vie/Models/forums_mode;.dart';
import 'package:la_vie/Screens/MobileApp/search_screen.dart';
import 'Cubit/lavie_cubit.dart';
import 'Models/product_model.dart';
import 'Screens/MobileApp/one_blog_screen.dart';
import 'Screens/MobileApp/scanned_blog_screen.dart';

String? token;
String? username;
String? userimage;
String? userId ;
enum AnswersEnum { a1 , a2 , a3 }


class Components{

  static Widget laVieLogo()=> Stack(
    children: [
      Column(
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 50,),
              Image(image: AssetImage('leaves.png')),
            ],
          ),
        ],
      ),
      Text("La Vie",
        style: TextStyle(
            fontFamily: "Meddon",
            fontSize: 32,
            fontWeight: FontWeight.w400,
          color: Colors.black
        ),),
    ],
  );

  static Widget mobileLogo() => Container(
    width: 140,
    child: Image.asset('assets/logo.png'),
  );

  static Widget myTextField(TextEditingController controller ) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: TextField(
      controller: controller,
            onChanged: (value) {},
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
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
  );

  static Widget passTextField(TextEditingController controller ) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: TextField(
      obscureText: true,
      controller: controller,
      onChanged: (value) {},
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 20.0),
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
  );

  static Widget myText(String txt) =>Text(txt , style: TextStyle(fontSize: 15),);

  static Widget myButton(String txt , Function function) => Padding(
    padding: const EdgeInsets.symmetric(vertical:8.0),
    child: Container(
      width: 1282,
      child: ElevatedButton(
          onPressed: function as void Function()?,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              txt,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                fontFamily: "Poppins"
              ),
            ),
          ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.green[500]!))))),
    ),
  );

  static Widget otherOption(String preTxt , String txt) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(preTxt ,
        style: TextStyle(
            color: Colors.grey
        ),),
      TextButton(onPressed:(){},
          child: Text(txt,
            style: TextStyle(
                color: Colors.green
            ),))
    ],
  );

  static Widget myDivider() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Expanded(
        child: Divider(
          indent: 20.0,
          endIndent: 10.0,
          thickness: 1,
        ),
      ),
      Text(
        "or continue with",
        style: TextStyle(color: Colors.green),
      ),
      Expanded(
        child: Divider(
          indent: 10.0,
          endIndent: 20.0,
          thickness: 1,
        ),
      ),
    ],
  );

  static Widget signinOptions() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image(
                  image: AssetImage('Google.png'),
                ),
                width: 43.82,
                height: 35,
              ),
              SizedBox(width: 10,),

              TextButton(
                  onPressed:(){

                  },
                  child: Text("Continue with Google",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                        fontSize: 15
                    ),))

            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[500]!),
            borderRadius: BorderRadius.circular(7)

        ),
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image(
                  image: AssetImage('Facebook.png'),
                ),
                width: 17.11,
                height: 21,
              ),
              SizedBox(width: 10,),
              TextButton(
                  onPressed:(){

                  },
                  child: Text("Continue with Facebook",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                        fontSize: 15
                    ),))

            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[500]!),
            borderRadius: BorderRadius.circular(7)

        ),
      ),


    ],
  );

  static Widget mobileSigninOptions(context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MaterialButton(
        shape: const CircleBorder(),
        onPressed: () {
          SigninCubit.get(context).googleSignup(context);

          },
        child:Image.asset('assets/Google.png' , height: 40, width: 40,)
      ),

      MaterialButton(
          shape: const CircleBorder(),
          onPressed: () {
            SigninCubit.get(context).facebookSignup(context);
            },
          child:Image.asset('assets/Facebook.png', height: 20, width: 20,)
      ),

    ],
  );

  static Widget iconsRow()=> Row(
    children: [
      IconButton(
          icon: SvgPicture.asset('Cart.svg'),
          onPressed: (){}),
      IconButton(
          icon: SvgPicture.asset('notif.svg'),
          onPressed: (){}),
      IconButton(
          icon: SvgPicture.asset('myProfile.svg'),
          onPressed: (){})
    ],
  );

  static Widget tags(String tagName )=> Container(
      // width: 40,
      // height: 40,
      decoration: BoxDecoration(
        color:Colors.grey[200],
        borderRadius: BorderRadius.circular(15)
      ),
      child: Center(
        child: Text(tagName , style: TextStyle(
            color: Colors.grey,
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            fontSize: 15
        ),),
      ),

    );

  static Widget forumsTag(String tagName) => Tab(
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 1)),
      child: Align(
        alignment: Alignment.center,
        child: Text(tagName , style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            fontSize: 15
        ),),
      ),
    ),);

  static Widget productComponent(context , ProductData product) => Card(
    elevation: 5,
    child:  Column(
        children: [
          Row(
              children: [
                product.imageUrl != null ? Container(
                    width: 55 ,
                    child: Image.network("https://lavie.orangedigitalcenteregypt.com${product.imageUrl}")) :
                Container(width: 55, child: Image.asset('assets/empty.png')) ,
                Container(child:
                IconButton(
                  icon: Icon(Icons.minimize_rounded , color: Colors.grey,size: 22,),
                  onPressed: (){
                    ProductsCubit.get(context).decrementItems(product);
                  },
                ),),
                Container(
                  child: Text(product.count.toString() , style: TextStyle(fontSize: 22),), //TEMPORARY
                ),
                Container(
                  child:
                  IconButton(
                    icon: Icon(Icons.add , color: Colors.grey,size: 22,),
                    onPressed: (){
                      ProductsCubit.get(context).incrementItems(product);
                    },
                  ),
                ),
              ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(alignment: Alignment.topLeft,
              child: Text(product.name!, style: TextStyle(fontSize: 14, fontFamily: 'Roboto' , color: Colors.black ,
              fontWeight: FontWeight.bold),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(alignment: Alignment.topLeft,child: Text(product.price.toString() + " EGP" ,style: TextStyle(fontSize: 15 , fontFamily: 'Roboto' , color: Colors.black ) )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0 , right: 8 ),
            child: myButton("Add To Cart", (){
              ProductsCubit.get(context).addToCart(product);
            }),
          ),
        ],
      ),
  ) ;

  static Widget productsGrid(context, int count, List<ProductData> product ) => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      scrollDirection: Axis.vertical,
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {

        return productComponent(context, product[index]);
      });


  static Widget notificationTile()=> Container(
    child: Row(
      children: [
         CircleAvatar(child: Image.asset('assets/tmpProfile.png'),radius: 50,
          backgroundColor: Colors.transparent,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Joy Arnold left 6 comments on Your Post " ,
                  style: TextStyle(
                    fontWeight: FontWeight.w700 ,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 15
                  ),),
              Text("Yesterday at 11:42 PM",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontFamily: 'Poppins',
                    fontSize: 15
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );

  static Widget recentSearchTile(String txt) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Row(
        children: [
          Icon(Icons.watch_later_outlined , color: Colors.grey,),
          SizedBox(width: 10,),
          Text(txt , style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            color: Colors.grey
          ),),
          SizedBox(width: 150,),

        ],
      ),
    ),
  );

  static Widget questionTile(CourseModel question , int index , int total) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text("Question " ,
                  style: TextStyle(fontFamily:'Roboto' , fontSize: 35 , color: Colors.black
                      , fontWeight: FontWeight.w600),),
                Text(index.toString(),
                  style: TextStyle(fontFamily:'Roboto' , fontSize: 35 , color: Colors.green,
                       fontWeight: FontWeight.w600),),
                Text("/" + total.toString(),
                  style: TextStyle(fontFamily:'Roboto' , fontSize: 15 , color: Colors.grey),),

              ],
            ),
            SizedBox(height : 40),
            Text(question.question ,
              style: TextStyle(fontFamily:'Roboto' , fontSize: 25 , color: Colors.black87,
                  fontWeight: FontWeight.w600),),
          ],
        ),
      ),


    ),
  );

  static Widget answerTile(context ,List<Answer> questionAnswers , bool isSelected , int index ) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      decoration: BoxDecoration(

          border: Border.all(color: Colors.green , width: 2),
        borderRadius: BorderRadius.circular(15),

      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(questionAnswers[index].answer??"Answer" ,
                    maxLines: 4,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      color: Colors.black
                    ),
                    ),
              ),

            IconButton(
                icon: questionAnswers[index].isSelected == true ?
                Icon(Icons.radio_button_checked , color: Colors.green,) :
                Icon(Icons.radio_button_off , color: Colors.green),
                onPressed: (){
                QuestionCubit.get(context).SelectAnswer(questionAnswers[index],questionAnswers,index);
                })
          ],
        ),
      ),



    ),
  );

  static Widget cartIsEmpty() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/empty.png'),
        Text("Your cart is empty",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          fontFamily: 'Roboto',
          color: Colors.black
        ),
        )
      ],
    ),
  );

  static Widget cartTile( context , ProductData product ) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 400,
      height: 125,
      child: Card(

        child : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: product.imageUrl != null ? Container(
                    width: 55 ,
                    height: 55,
                    child: Image.network("https://lavie.orangedigitalcenteregypt.com${product.imageUrl}")) :
                Container(width: 55, child: Image.asset('assets/empty.png')) ,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(product.name!,
                 style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 20,
                     fontFamily: 'Roboto',
                     color: Colors.black
                 ),),
                 Text(product.price.toString() + " EGP" ,
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 15,
                       fontFamily: 'Roboto',
                       color: Colors.green
                   ),),
                 Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: Colors.grey[100],
                         ),
                         child: Row(
                           children: [
                             IconButton(
                               icon: Icon(Icons.minimize_rounded , color: Colors.green, size: 30),
                               onPressed: (){
                                 ProductsCubit.get(context).decrementItems(product);
                               },
                             ),
                             Text(product.count.toString(), style: TextStyle(fontFamily: 'Roboto' , fontSize: 25),),
                             IconButton(
                               icon: Icon(Icons.add , color: Colors.green, size: 30),
                               onPressed: (){
                                 ProductsCubit.get(context).incrementItems(product);
                               },
                             ),
                           ],
                         ),
                       ),
                       IconButton(
                         icon: Icon(Icons.restore_from_trash_outlined , color: Colors.green, size: 30,),
                         onPressed: (){ProductsCubit.get(context).removeItems(product);},
                       ),
                     ],
                   ),
                 )
               ],
              )
            ],
          ),
        )

      ),
    ),
  );

  static Widget blogTile(context , BlogPlants blogsList) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 400,
      height: 145,
      child: Card(
          child : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>  OneBlogScreen(plant: blogsList,)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: blogsList.imageUrl != "" ? Container(
                          child: Image.network("https://lavie.orangedigitalcenteregypt.com${blogsList.imageUrl}")) :
                      Container(width: 55, child: Image.asset('assets/empty.png')) ,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text("few days ago" ,
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Roboto',
                                color: Colors.green
                            ),),
                      SizedBox(height: 10,),
                      Expanded(
                          child: Text(blogsList.name! ,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: 'Roboto',
                                color: Colors.black
                            ),),
                        ),
                      Expanded(
                        child: Text(blogsList.description!,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                color: Colors.grey
                            ),),
                      ),

                    ],
                  )
                ],
              ),
            ),
          )

      ),
    ),
  );

  static Widget searchBar(TextEditingController controller, context) => TextField(
      controller: controller,
      onTap: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SearchScreen())
        );
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
              borderSide: BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          )),
    );

  static Widget forumTile(Data forumData , context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]! , width: 1)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(child:
                        forumData.user!.imageUrl != null ? Image.network("${forumData.user!.imageUrl}"):
                        Image.network("https://st4.depositphotos.com/17828278/24401/v/600/depositphotos_244011872-stock-illustration-image-vector-symbol-missing-available.jpg")
,
                          radius: 24,
                        backgroundColor: Colors.transparent,),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text( forumData.user!.completeName?? "user"  ,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                    color: Colors.black
                                  ),),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("days ago" ,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    color: Colors.grey[700]
                                ),),
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(forumData.title!,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: Colors.green
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(forumData.description! ,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: Colors.grey[800]
                    ),),
                ),
                Center(
                  child:
                  forumData.imageUrl != null ? Image.network("https://lavie.orangedigitalcenteregypt.com${forumData.imageUrl}"):
                      Image.network("https://st4.depositphotos.com/17828278/24401/v/600/depositphotos_244011872-stock-illustration-image-vector-symbol-missing-available.jpg")
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  IconButton(icon: Icon(Icons.thumb_up_alt_outlined ,
                     color:
                     DiscussionForumsCubit.get(context).pressed == false ?
                     Colors.grey[700] : Colors.green,),
                      onPressed: (){

                      DiscussionForumsCubit.get(context).Like(forumData);

                         }
                      ),
                  Text(forumData.ForumLikes.length.toString() + " Likes" , style: TextStyle(
                    fontSize: 15 ,
                    color: Colors.grey[700],
                    fontFamily: 'Roboto'
                  ),)
                ],),
                InkWell(
                  onTap: (){
                    var commentCtrl = TextEditingController();
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius:new BorderRadius.only(
                              topLeft: const Radius.circular(50.0),
                              topRight: const Radius.circular(50.0))
                        ),
                        builder: (builder){
                          return Column(

                            children: [
                              SizedBox(
                                  child: ListView.separated(
                                      itemBuilder: (context, index) => Components.commentTile(forumData.ForumComments , index),
                                      separatorBuilder: (context, index) => Divider(
                                        indent: 20.0,
                                        endIndent: 10.0,
                                        thickness: 1,
                                      ),
                                      itemCount: forumData.ForumComments.length),
                                  height: 350,
                                ),
                              SizedBox(
                                width: 320 ,
                                height:60,
                                child: Row(
                                  children: [
                                    Expanded( child: myTextField(commentCtrl)),
                                     IconButton(
                                        onPressed: (){
                                          DiscussionForumsCubit.get(context).Comment(forumData, commentCtrl.text);
                                        },
                                        icon: Icon(Icons.double_arrow_rounded , size: 18,),
                                      ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }
                    );
                  },
                  child: Text(forumData.ForumComments.length.toString() +" Replies" , style: TextStyle(
                      fontSize: 15 ,
                      color: Colors.grey[700],
                      fontFamily: 'Roboto'
                  ),),
                ) //TO BE HANDLED

              ],
            ),
          )
        ],
      ),

    ),
  );

  static Widget commentTile(List<Comments> comment , index) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      child:
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(comment[index].userId! != userId ? comment[index].userId! : username!   ,
                  style: TextStyle(
                      fontWeight: FontWeight.w700 ,
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                      fontSize: 12
                  ),),
                Row(
                  children: [
                    Icon(Icons.arrow_right),
                    Text(comment[index].comment!,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 15
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

    ),
  );

  static Widget scannedPlantData(String dataText , String descriptionText , IconData icon)=> Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: Colors.grey,),),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dataText ,
              style: TextStyle(
                  fontFamily: 'Roboto',
                fontSize: 19,
                fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
            Text(descriptionText , style: TextStyle(fontFamily: 'Roboto' , color: Colors.white),)
          ],
        )
      ],
    ),
  );






}








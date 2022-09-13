import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Networking/DioHelper.dart';
import 'package:la_vie/Screens/MobileApp/home_screen.dart';
import 'package:la_vie/Screens/MobileApp/login_signup_screen.dart';
import 'package:la_vie/Screens/MobileApp/splash_screen.dart';
import 'package:la_vie/Shared%20Prefrences/shared_pref.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Components.dart';
import 'Screens/MobileApp/qr_screen.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
   await CacheHelper.init();
   Widget widget ;

   token = CacheHelper.getData(key: 'token');

  if(token == null){
    widget = SplashScreen();
  }else{
    widget = MobileHome();
  }

  //runApp(LaVie());
  runApp(LaVie(startWidget: widget));
}
class LaVie extends StatelessWidget {

  bool tmpNotif = true;
  final Widget? startWidget ;

  LaVie({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SigninCubit()),
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => QuestionCubit()),
          BlocProvider(create: (context) => ProductsCubit()),
          BlocProvider(create: (context) => BlogCubit()),
          BlocProvider(create: (context) => DiscussionForumsCubit())

        ],
        child: ResponsiveSizer(
            builder: (context,orientation,screenType){

              return  MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      appBarTheme: AppBarTheme(
                          backgroundColor: Colors.white,
                          elevation: 0
                      ),
                      primarySwatch: Colors.green,
                      scaffoldBackgroundColor: Colors.grey[100],

                      backgroundColor: Colors.white,
                      bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        elevation: 0,
                        unselectedIconTheme:
                        IconThemeData(color: Colors.black, size: 30),
                        selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
                        unselectedItemColor: Colors.black,
                        selectedItemColor: Colors.white,
                      ),
                      iconTheme: IconThemeData(color: Colors.black)
                  ),
                  home: Scaffold(
                    body: startWidget,
                  )
              );
            }),);
  }
}
// WEB WEB WEB
// Scaffold(
// appBar: AppBar(
// actions: [
// Padding(
// padding: EdgeInsets.only(left: 8.0),
// child: ReusableComponents.laVieLogo(),
// ),
// SizedBox(
// width: 18,
// ),
// Expanded(
// child: DefaultTabController(
// length: 5, // length of tabs
// initialIndex: 0,
// child: Column(
// children: [
// TabBar(
// labelColor: Colors.green,
// unselectedLabelColor: Colors.black,
// indicatorColor: Colors.transparent,
//
// labelStyle: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.w600,
// color: Colors.black),
// tabs: [
// Tab(
// text: "Home",
// ),
// Tab(
// text: "Shop",
// ),
// Tab(
// text: "Blog",
// ),
// Tab(
// text: "About",
// ),
// Tab(
// text: "Community",
// ),
// ],
//
// //isScrollable: true,
// ),
//
// ],
// ),
// ),
// ),
// SizedBox(
// width: 15,
// ),
// tmpNotif == true? Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// height: 20,
// child: ElevatedButton(
// onPressed: () {},
// child: Text(
// "Sign up",
// style: TextStyle(
// color: Colors.white,
// fontSize: 15,
// fontWeight: FontWeight.w100),
// ),
// style: ButtonStyle(
// shape: MaterialStateProperty.all<RoundedRectangleBorder>(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0),
// side: BorderSide(color: Colors.green[500]))))),
// ),
// ) : ReusableComponents.iconsRow()
// ],
// ),
// body: HomeScreen(),
// ),

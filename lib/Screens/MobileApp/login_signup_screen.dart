import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Cubit/lavie_states.dart';
import 'package:la_vie/Networking/DioHelper.dart';
import 'package:la_vie/Components.dart';
import 'package:la_vie/Networking/end_points.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MobileLoginSignUpScreen extends StatelessWidget {
  var signupEmailController = TextEditingController();
  var signupPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();

  bool tmp = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SigninCubit(),
      child: BlocConsumer<SigninCubit, LaVieStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
            backgroundColor: Colors.white,
            body:
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0 , right: 20 , top: 100),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Components.mobileLogo(),
                  SizedBox(height: 20,),
                  DefaultTabController(
                    length: 2, // length of tabs
                    initialIndex: 0,
                    child: Expanded(
                      child: Column(
                          children: [
                            Container(
                              child: TabBar(
                                labelColor: Colors.green,
                                indicatorSize: TabBarIndicatorSize.label,
                                unselectedLabelColor: Colors.black,
                                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                                tabs: [
                                  Tab(
                                    text: "Sign up",
                                  ),
                                  Tab(
                                    text: "Login",
                                  ),
                                ],
                                //isScrollable: true,
                              ),
                            ),
                            Expanded(
                              child: TabBarView(children: [
                                //Sign up Tab
                                SingleChildScrollView(
                                  child: Padding(
                                      padding: const EdgeInsets.only(top: 15.0 , left: 15 , right: 15),
                                      child: Column(
                                         // mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(child: Components.myText("First Name")),

                                                Expanded(child: Components.myText("Last Name")),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(child:Components.myTextField(firstNameController),),
                                                SizedBox(width: 10,),
                                                Expanded(child: Components.myTextField(lastNameController)),

                                              ],
                                            ),
                                            Components.myText("Email"),
                                            Components.myTextField(signupEmailController),
                                            Components.myText("Password"),
                                            Components.passTextField(signupPasswordController),
                                            Components.myText("Confirm Password"),
                                            Components.passTextField(confirmPasswordController),
                                            Components.myButton("Sign up" , (){

                                                      if(confirmPasswordController.text == signupPasswordController.text){
                                                        SigninCubit.get(context).userSignup(
                                                            firstName: firstNameController.text,
                                                            lastName: lastNameController.text,
                                                            email: signupEmailController.text,
                                                            password: signupPasswordController.text,
                                                        context: context);
                                                      }
                                                      else if (confirmPasswordController.text  == ""){
                                                        Fluttertoast.showToast(
                                                            msg: "Please confirm your password.",
                                                            toastLength: Toast.LENGTH_LONG,
                                                            gravity: ToastGravity.SNACKBAR,
                                                            timeInSecForIosWeb: 1,
                                                            backgroundColor: Colors.black.withOpacity(0.5),
                                                            textColor: Colors.white,
                                                            fontSize: 15.0);

                                                      }
                                                      else{
                                                        Fluttertoast.showToast(
                                                            msg: "Passwords don't match",
                                                            toastLength: Toast.LENGTH_LONG,
                                                            gravity: ToastGravity.SNACKBAR,
                                                            timeInSecForIosWeb: 1,
                                                            backgroundColor: Colors.black.withOpacity(0.5),
                                                            textColor: Colors.white,
                                                            fontSize: 15.0);

                                                      }

                                                    }),
                                            Components.myDivider(),
                                            Components.mobileSigninOptions(context)
                                          ],
                                        ),
                                    ),
                                ),
                                //Login Tab
                                SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 70.0 , left: 15 , right: 15 ),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Components.myText("Email"),
                                        Components.myTextField(emailController),
                                        Components.myText("Password"),
                                        Components.passTextField(passwordController),

                                        Components.myButton("Login" , (){

                                          SigninCubit.get(context).userLogin(
                                              email: emailController.text,
                                              password: passwordController.text , context: context);

                                        }),
                                        Components.myDivider(),
                                        Components.mobileSigninOptions(context)



                                      ],
                                    ),
                                  ),
                                ),

                              ]),
                            ),
                          ],
                        ),
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
      ),

    );
  }
}

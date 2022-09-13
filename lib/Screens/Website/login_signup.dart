import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Cubit/lavie_states.dart';
import 'package:la_vie/Networking/DioHelper.dart';
import 'package:la_vie/Components.dart';
import 'package:la_vie/Networking/end_points.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WebLoginSignUpScreen extends StatelessWidget {
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
            body:
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
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
                    SizedBox(
                      height: 650,
                      child: TabBarView(children: [
                       //Sign up
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 400, right: 400, top: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 300,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Components.myText("First Name"),
                                          Components.myTextField(firstNameController),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 300,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Components.myText("Last Name"),
                                          Components.myTextField(lastNameController),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Components.myText("Email"),
                                Components.myTextField(emailController),
                                Components.myText("Password"),
                                Components.myTextField(passwordController),
                                Components.myText("Confirm Password"),
                                Components.myTextField(confirmPasswordController),
                                Components.myButton("Sign up" , (){

                                  if(confirmPasswordController.text == passwordController.text){
                                    SigninCubit.get(context).userSignup(
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                  else{
                                    //TO be handled
                                  }

                                }),
                                Components.otherOption(
                                    "Already have an account?", "Login"),
                                SizedBox(
                                  height: 20,
                                ),
                                Components.signinOptions()
                              ],
                            ),
                          ),
                        ),
                       //Login
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 400),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Components.myText("Email"),
                              Components.myTextField(emailController),
                              Components.myText("Password"),
                              Components.myTextField(passwordController),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            value: tmp,
                                            onChanged: (value) {
                                              value = true;
                                            }),
                                        Text(
                                          "Remember me",
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Forget Password?",
                                        style: TextStyle(
                                            color: Colors.green,
                                            decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.w500),
                                      ))
                                ],
                              ),
                              Components.myButton("Login",
                                  (){
                                    SigninCubit.get(context).userLogin(email: emailController.text,
                                        password: passwordController.text);
                                  }
                              ),
                              Components.otherOption(
                                  "Don\'t have an account?", "Sign up"),
                              SizedBox(
                                height: 20,
                              ),
                              Components.signinOptions()
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ]),
          );
        },
      ),

    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie/Models/blog_model.dart';
import 'package:la_vie/Models/exam_model.dart';
import 'package:la_vie/Models/forums_mode;.dart';
import 'package:la_vie/Models/login_signup_model.dart';
import 'package:la_vie/Models/product_model.dart';
import 'package:la_vie/Networking/DioHelper.dart';
import 'package:la_vie/Networking/end_points.dart';
import 'package:la_vie/Screens/MobileApp/course_exam_screen.dart';
import 'package:la_vie/Screens/MobileApp/discussion_forums_screen.dart';
import 'package:la_vie/Screens/MobileApp/notifications_screen.dart';
import 'package:la_vie/Screens/MobileApp/products_screen.dart';
import 'package:la_vie/Screens/MobileApp/home_screen.dart';
import 'package:la_vie/Screens/MobileApp/profile_screen.dart';
import 'package:la_vie/Screens/MobileApp/qr_screen.dart';
import 'package:la_vie/Shared%20Prefrences/shared_pref.dart';
import '../Components.dart';
import '../Networking/google_signin.dart';
import 'lavie_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninCubit extends Cubit<LaVieStates> {
  SigninCubit() : super(InitialState());

  static SigninCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;
  AccessToken? accessToken;

  void userLogin({required email, required password, context}) {
    print(SIGNIN);
    DioHelper.loginPostData(
        endpoint: SIGNIN,
        data: {'password': password, 'email': email}).then((value) {
      emit(SigninSuccessState());
      // print('hi');
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);

      CacheHelper.saveData(key: 'token', value: loginModel.user!.accessToken)
          .then((value) {
        ProductsCubit.get(context).getAllProducts();
        DiscussionForumsCubit.get(context).getAllForums();
        DiscussionForumsCubit.get(context).getMyForums();
        BlogCubit.get(context).getAllBlogs();
        username = loginModel.user!.firstName;
        userimage = loginModel.user!.imageUrl;
        userId = loginModel.user!.id;
        token = loginModel.user!.accessToken;
        print(username);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => MobileHome()));
      });
    }).catchError((error) {
      emit(SignupErrorState());
      if (error is DioError) {
        print(error.type);
        Fluttertoast.showToast(
            msg: error.response!.data['message'].toString().replaceAll('[', '').replaceAll(']', ''),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black.withOpacity(0.5),
            textColor: Colors.white,
            fontSize: 15.0);
      }
    });
  }

  void userSignup({required firstName, required lastName, required email, required password, context}) {
    DioHelper.loginPostData(endpoint: SIGNUP, data: {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    }).then((value) {
      print("HI");
      emit(SignupSuccessState());
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);

      CacheHelper.saveData(key: 'token', value: loginModel.user!.accessToken)
          .then((value) {
        ProductsCubit.get(context).getAllProducts();
        DiscussionForumsCubit.get(context).getAllForums();
        DiscussionForumsCubit.get(context).getMyForums();
        BlogCubit.get(context).getAllBlogs();

        username = loginModel.user!.firstName;
        userimage = loginModel.user!.imageUrl;
        token = loginModel.user!.accessToken;

        print(username);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => CourseExam()));
      });
    }).catchError((error) {
      emit(SignupErrorState());
      if (error is DioError) {
        print(error.type);
        Fluttertoast.showToast(
            msg: error.response!.data['message'].toString().replaceAll('[', '').replaceAll(']', ''),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black.withOpacity(0.5),
            textColor: Colors.white,
            fontSize: 15.0);
      }
    });
  }

  Future googleSignup(context) async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      print("NULL USER");
    } else {
      int idx = user.displayName!.indexOf(" ");
      List firstAndLastName = [
        user.displayName!.substring(0, idx).trim(),
        user.displayName!.substring(idx + 1).trim()
      ];
      print(firstAndLastName[0]);
      print(firstAndLastName[1]);

      DioHelper.loginPostData(endpoint: GOOGLE, data: {
        "id": user.id,
        "email": user.email,
        "firstName": firstAndLastName[0],
        "lastName": firstAndLastName[1],
        "picture": user.photoUrl,
      }).then((value) {
        print("HI");
        emit(SignupSuccessState());
        print(value.data);
        loginModel = LoginModel.fromJson(value.data);
        username = loginModel.user!.firstName;
        userimage = loginModel.user!.imageUrl;
        token = loginModel.user!.accessToken;
        print(username);

        CacheHelper.saveData(key: 'token', value: loginModel.user!.accessToken)
            .then((value) {
          print(token);
          ProductsCubit.get(context).getAllProducts();
          DiscussionForumsCubit.get(context).getAllForums();
          DiscussionForumsCubit.get(context).getMyForums();
          BlogCubit.get(context).getAllBlogs();

          username = loginModel.user!.firstName;
          userimage = loginModel.user!.imageUrl;
          print(username);

          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => MobileHome()));
        });
      }).catchError((error) {
        emit(SignupErrorState());
          print(error.type);
          Fluttertoast.showToast(
              msg: error.response!.data['message'].toString().replaceAll('[', '').replaceAll(']', ''),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black.withOpacity(0.5),
              textColor: Colors.white,
              fontSize: 15.0);
      });
    }
  }

  Future facebookSignup(context) async {
    final LoginResult result = await FacebookAuth.i.login();
    if (result.status == LoginStatus.success) {
      accessToken = result.accessToken;

      final data = await FacebookAuth.i.getUserData();

      FacebookUserModel facebookUserModel = FacebookUserModel.fromJson(data);

      int idx = facebookUserModel.name!.indexOf(" ");
      List firstAndLastName = [
        facebookUserModel.name!.substring(0, idx).trim(),
        facebookUserModel.name!.substring(idx + 1).trim()
      ];

      print(facebookUserModel.id);
      print(facebookUserModel.email);
      print(firstAndLastName[0]);
      print(firstAndLastName[1]);
      print(facebookUserModel.picture!.url);

      DioHelper.loginPostData(endpoint: FACEBOOK, data: {
        "id": facebookUserModel.id,
        "email": facebookUserModel.email,
        "firstName": firstAndLastName[0],
        "lastName": firstAndLastName[1],
        "photo": facebookUserModel.picture!.url,
      }).then((value) {
        print("HI");
        emit(SignupSuccessState());
        print(value.data);
        loginModel = LoginModel.fromJson(value.data);
        username = loginModel.user!.firstName;
        userimage = loginModel.user!.imageUrl;
        token = loginModel.user!.accessToken;
        print(username);

        CacheHelper.saveData(key: 'token', value: loginModel.user!.accessToken)
            .then((value) {
          ProductsCubit.get(context).getAllProducts();
          DiscussionForumsCubit.get(context).getAllForums();
          DiscussionForumsCubit.get(context).getMyForums();
          BlogCubit.get(context).getAllBlogs();

          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => MobileHome()));
        });
      }).catchError((error) {
        emit(SignupErrorState());
        emit(SignupErrorState());
          print(error.type);
          Fluttertoast.showToast(
              msg: error.response!.data['message'].toString().replaceAll('[', '').replaceAll(']', ''),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black.withOpacity(0.5),
              textColor: Colors.white,
              fontSize: 15.0);
      });
    }
  }
}

class HomeCubit extends Cubit<LaVieStates> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int whichTag = 0;

  int activePage = 2;

  void changeIndex(int index) {
    activePage = index;
    emit(AppBottomNavBarState());
  }

  List<Widget> bottomNavScreens = [
    DiscussionForumsScreen(),
    QRScreen(),
    ProductsScreen(),
    NotificationScreen(),
    UserProfile()
  ];
}

class QuestionCubit extends Cubit<LaVieStates> {
  QuestionCubit() : super(InitialState());

  static QuestionCubit get(context) => BlocProvider.of(context);

  List<CourseModel> questionsList = [
    CourseModel(
        "What is the user experience?",
        [
          new Answer(
              'The user experience is how the developer feels about a user.',
              false),
          new Answer(
              'The user experience is how the user feels about interacting with or experiencing a product.',
              false),
          new Answer(
              'The user experience is the attitude the UX designer has about a product.',
              false),
        ],
        3),
    CourseModel(
        "What is the user experience?",
        [
          new Answer(
              'The user experience is how the developer feels about a user.',
              false),
          new Answer(
              'The user experience is how the user feels about interacting with or experiencing a product.',
              false),
          new Answer(
              'The user experience is the attitude the UX designer has about a product.',
              false),
        ],
        3),
    CourseModel(
        "What is the user experience?",
        [
          new Answer(
              'The user experience is how the developer feels about a user.',
              false),
          new Answer(
              'The user experience is how the user feels about interacting with or experiencing a product.',
              false),
          new Answer(
              'The user experience is the attitude the UX designer has about a product.',
              false),
        ],
        3),
  ];

  List<Answer> quesAnswers = [
    new Answer(
        'The user experience is how the developer feels about a user.', false),
    new Answer(
        'The user experience is how the user feels about interacting with or experiencing a product',
        false),
    new Answer(
        'The user experience is the attitude the UX designer has about a product.',
        false),
  ];

  int quesCounter = 0;

  void SelectAnswer(Answer questionAnswers , List<Answer> answersList , int index){
    if(questionAnswers.isSelected == true){
      questionAnswers.isSelected = false;
      emit(SelectAnswerState());

    }else if(questionAnswers.isSelected == false){
      questionAnswers.isSelected = true ;
      for(int i = 0 ; i < 3 ; i++){
        if(i == index) continue;
        else {
          answersList[i].isSelected = false ;
        }
      }
      emit(UnselectAnswerState());
    }
  }

  @override
  void incQuesCounter() {
    if (quesCounter < questionsList.length) {
      quesCounter++;
      emit(nextQuestion());
    }
  }

  @override
  void decQuesCounter() {
    if (quesCounter > 0) {
      quesCounter--;
      emit(nextQuestion());
    }
  }

}

class ProductsCubit extends Cubit<LaVieStates> {
  ProductsCubit() : super(InitialState());

  static ProductsCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;
  List<ProductData> allProducts = [];
  List<ProductData> allPlants = [];
  List<ProductData> allTools = [];
  List<ProductData> allSeeds = [];
  List<ProductData> cartProducts = [];
  List<Widget> recentSearch = [];
  List<Widget> showedSearchResults = [];

  int totalPrice = 0;

  var searchController = TextEditingController();
  bool addRecent = false;

  void addToCart(ProductData product) {
    cartProducts.add(product);
    totalPrice += product.price!;
    // totalPrice += (product.price * product.count);
    emit(AddedToCart());
  }

  void incrementItems(ProductData product) {
    product.count++;
    totalPrice += product.price!;
    print(product.count);
    emit(IncrementItemCountState());
  }

  void decrementItems(ProductData product) {
    product.count--;
    totalPrice -= product.price!;
    emit(DecrementItemCountState());
  }

  void removeItems(ProductData product) {
    totalPrice -= product.price!;
    cartProducts.remove(product);
    emit(RemoveItemCountState());
  }

  void checkOut(context) {
    Fluttertoast.showToast(
        msg: "Happy purchase!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black12.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 15.0);

    cartProducts.clear();
    totalPrice = 0;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MobileHome();
    }));
    emit(RemoveItemCountState());
  }

  void getAllProducts() {
    DioHelper.getDataWithoutParameters(endpoint: PRODUCTS).then((value) {
      emit(GetAllProductsSuccessState());
      print(value.data);

      homeModel = HomeModel.fromJson(value.data);

      separateProducts();
    }).catchError((error) {
      emit(SigninErrorState());
      print(error.toString());
    });
  }

  void separateProducts() {
    for (int i = 0; i < homeModel!.data!.length; i++) {
      if (homeModel!.data![i].type == "PLANT") {
        allPlants.add(homeModel!.data![i]);
        allProducts.add(homeModel!.data![i]);
      } else if (homeModel!.data![i].type == "SEED") {
        allSeeds.add(homeModel!.data![i]);
        allProducts.add(homeModel!.data![i]);
      } else if (homeModel!.data![i].type == "TOOL") {
        allTools.add(homeModel!.data![i]);
        allProducts.add(homeModel!.data![i]);
      }
    }
  }

  void searchProducts(String text, context) {
    print(showedSearchResults.length);
    showedSearchResults.clear();

    for (var i = 0; i < allProducts.length; i++) {
      if (text != "") {
        if (allProducts[i].name!.startsWith(text) ||
            allProducts[i].name!.toLowerCase().startsWith(text)) {
          showedSearchResults.add(
              Components.productComponent(context, allProducts[i]));
          emit(Search());
        }

        print(showedSearchResults);
        print(recentSearch);
      }
    }
  }

  void saveRecentSearch(String text){
    if(text != ""){
      recentSearch.add(Components.recentSearchTile(text));
    }
    emit(RecentSearch());
  }
}

class BlogCubit extends Cubit<LaVieStates> {
  BlogCubit() : super(InitialState());

  static BlogCubit get(context) => BlocProvider.of(context);

  late BlogModel blogModel;
  List<String> tmpBlogs = ["hi", "hi", "hi", "hi"];

  List<BlogPlants> blogPlants=[];
  List<BlogSeeds> blogSeeds=[];
  List<BlogTools> blogTools=[];

  void separateBlogs() {
    for (int i = 0; i < blogModel.data!.plants!.length; i++) {
      blogPlants.add(blogModel.data!.plants![i]);
    }
    for (int i = 0; i < blogModel.data!.seeds!.length; i++) {
      blogSeeds.add(blogModel.data!.seeds![i]);
    }
    for (int i = 0; i < blogModel.data!.tools!.length; i++) {
      blogTools.add(blogModel.data!.tools![i]);
    }
  }

  void getAllBlogs() {
    DioHelper.getDataWithoutParameters(endpoint: BLOGS).then((value) {
      emit(GetBlogsSuccess());
      print(value.data);
      blogModel = BlogModel.fromJson(value.data);

      separateBlogs();

    }).catchError((error) {
      emit(GetBlogsError());
      print(error.toString());
    });
  }

  BlogPlants? findByID(String id){
    for (int i = 0; i < blogModel.data!.plants!.length; i++) {
      if(blogModel.data!.plants![i].plantId == id){
        return blogModel.data!.plants![i];
      }
    }
  }


}

class DiscussionForumsCubit extends Cubit<LaVieStates> {
  DiscussionForumsCubit() : super(InitialState());

  static DiscussionForumsCubit get(context) => BlocProvider.of(context);
  late ForumsModel allForumsModel;
  late ForumsModel myForumsModel;

  var forumsSearchController = TextEditingController();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  bool pressed = false;

  List<String> tmp = ["hi", "hi", "hi", "hi"];

  final ImagePicker picker = ImagePicker();

  String? imageFuture;

  void pickImage() async {
    final XFile? image = await (picker.pickImage(source: ImageSource.gallery)
        as FutureOr<XFile?>);
    final path = image!.path;

    imageFuture = path;
    emit(AddPhotoState());
  }

  void getAllForums() {
    DioHelper.getDataWithoutParameters(endpoint: FORUMS).then((value) {
      emit(GetForumsSuccessState());
      print(value.data);
      allForumsModel = ForumsModel.fromJson(value.data, FORUMS);
    }).catchError((error) {
      emit(GetForumsErrorState());
      print(error.toString());
    });
  }

  void getMyForums() {
    print(token);
    DioHelper.getDataWithoutParameters(endpoint: MYFORUMS).then((value) {
      emit(GetForumsSuccessState());
      //   print(value.data);
      myForumsModel = ForumsModel.fromJson(value.data, MYFORUMS);
    }).catchError((error) {
      emit(GetForumsErrorState());
      print(error.toString());
    });
  }

  late Likes newLike;
  void Like(Data forumData) {
    if (pressed == false) {
      DioHelper.postDataWithoutParameters(
              endpoint: 'forums/${forumData.forumId}/like')
          .then((value) {
        emit(LikeState());
        print('forums/${forumData.forumId}/like');
        print(value.data);
        newLike = Likes.fromJson(value.data);
        forumData.ForumLikes.add(newLike);
        if (newLike.userId == userId) {
          pressed = true;
        }
      });
    } else if (pressed == true) {
      DioHelper.postDataWithoutParameters(
              endpoint: 'forums/${forumData.forumId}/like')
          .then((value) {
        emit(RemoveLikeState());
        forumData.ForumLikes.removeLast();
        print('forums/${forumData.forumId}/like');
        print(value.data);
      });
      if (newLike.userId == userId) {
        pressed = false;
      }
    }
  }

  late Comments newComment;
  void Comment(Data forumData, String commentTxt) {
    DioHelper.postData(
        endpoint: 'forums/${forumData.forumId}/comment',
        data: {'comment': commentTxt}).then((value) {
      emit(AddCommentSuccess());
      newComment = Comments.fromJson(value.data);
      forumData.ForumComments.add(newComment);
      print(value.data);
    });
  }

  void postForum(String title, String description, String img, context) async {
    File imagefile = File(img); //convert Path to File
    Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
    String base64string =
        base64.encode(imagebytes); //convert bytes to base64 string

    String image64ToAPI = "data:image/jpeg;base64," + base64string;
    print(base64string);

    DioHelper.postData(endpoint: FORUMS, data: {
      "title": title,
      "description": description,
      "imageBase64": image64ToAPI
    }).then((value) {
      Fluttertoast.showToast(
          msg: "Forum posted successfully!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 15.0);

      titleController.clear();
      descriptionController.clear();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return DiscussionForumsScreen();
      }));

      emit(PostForumSuccess());
    }).catchError((error) {
      print(error.toString());
    });
  }
}

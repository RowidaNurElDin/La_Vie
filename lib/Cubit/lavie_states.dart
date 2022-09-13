import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LaVieStates{}

class InitialState extends LaVieStates{}

class SigninSuccessState extends LaVieStates{}

class SigninErrorState extends LaVieStates{}

class SignupSuccessState extends LaVieStates{}

class SignupErrorState extends LaVieStates{}

class nextQuestion extends LaVieStates{}

class GetAllProductsSuccessState extends LaVieStates{}

class GetAllSeedsSuccessState extends LaVieStates{}

class AppBottomNavBarState extends LaVieStates{}

class AddedToCart extends LaVieStates{}

class IncrementItemCountState extends LaVieStates{}

class DecrementItemCountState extends LaVieStates{}

class RemoveItemCountState extends LaVieStates{}

class checkoutState extends LaVieStates{}

class GetForumsSuccessState extends LaVieStates{}

class GetForumsErrorState extends LaVieStates{}

class LikeState extends LaVieStates{}

class RemoveLikeState extends LaVieStates{}

class AddPhotoState extends LaVieStates{}

class PostForumSuccess extends LaVieStates{}

class PostForumError extends LaVieStates{}

class AddCommentSuccess extends LaVieStates{}

class AddCommentFail extends LaVieStates{}

class Search extends LaVieStates{}

class RecentSearch extends LaVieStates{}

class GetBlogsSuccess extends LaVieStates{}

class GetBlogsError extends LaVieStates{}

class SelectAnswerState extends LaVieStates{}

class UnselectAnswerState extends LaVieStates{}









class ForumsModel{
  String? type ;
  String? message;
  List<Data> data = [];

  ForumsModel.fromJson(Map<String,dynamic> json , String endpoint){
    type = json['type'];
    message = json['message'];
    json['data'].forEach((element){
      data.add(Data.fromJson(element));
    });
  }
}

class Data{
  String? forumId ;
  String? title;
  String? description;
  String? imageUrl ;
  String? userId ;
  List<Likes> ForumLikes = [];
  List<Comments> ForumComments = [] ;
  FormUser? user ;

  Data.fromJson(Map<String, dynamic> json){
    forumId = json['forumId'];
    userId = json['userId'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    title = json['title'];
    user = FormUser.fromJson(json['user']);

    json['ForumLikes'].forEach((element){
      ForumLikes.add(Likes.fromJson(element));
    });


    json['ForumComments'].forEach((element){
      ForumComments.add(Comments.fromJson(element));
    });



  }
}

class Likes{
  String? forumId;
  String? userId;

  Likes.fromJson(Map<String, dynamic> json){
    forumId = json['forumId'];
    userId = json['userId'];
  }

  Likes(this.forumId, this.userId);
}

class Comments{
  String? forumCommentId;
  String? forumId;
  String? userId;
  String? comment;
  String? createdAt;

  Comments.fromJson(Map<String,dynamic> json){
    forumCommentId = json['forumCommentId'];
    forumId = json['forumId'];
    userId = json['userId'];
    comment = json['comment'];
    createdAt = json['createdAt'];
  }
}

class FormUser{
  String? firstName ;
  String? lastName ;
  String? imageUrl ;
  String? completeName;

  FormUser.fromJson(Map<String , dynamic> json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    imageUrl = json['imageUrl'];
    completeName = firstName! + " "+ lastName!;
  }

}

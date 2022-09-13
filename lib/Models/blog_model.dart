class BlogModel {
  String? type;
  String? message;
  BlogData? data;

  BlogModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new BlogData.fromJson(json['data']) : null;
  }

}

class BlogData {
  List<BlogPlants>? plants;
  List<BlogSeeds>? seeds;
  List<BlogTools>? tools;

  BlogData.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      plants = <BlogPlants>[];
      json['plants'].forEach((v) {
        plants!.add(new BlogPlants.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      seeds = <BlogSeeds>[];
      json['seeds'].forEach((v) {
        seeds!.add(new BlogSeeds.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      tools = <BlogTools>[];
      json['tools'].forEach((v) {
        tools!.add(new BlogTools.fromJson(v));
      });
    }
  }
}

class BlogPlants {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  BlogPlants.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }
}

class BlogSeeds {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  BlogSeeds.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

}

class BlogTools {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  BlogTools.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

}

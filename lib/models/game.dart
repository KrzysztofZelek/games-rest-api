import 'dart:convert';

class Game {
  final int id;
  final String title;
  final String worth;
  final String thumbnail;
  final String image;
  final String description;
  final String publishedDate;
  final String platforms;
  final int users;

  Game(
      {required this.id,
      required this.title,
      required this.worth,
      required this.thumbnail,
      required this.image,
      required this.description,
      required this.publishedDate,
      required this.platforms,
      required this.users});

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json['id'],
        title: json['title'],
        worth: json['worth'],
        thumbnail: json['thumbnail'],
        image: json['image'],
        description: json['description'],
        publishedDate: json['published_date'],
        platforms: json['platforms'],
        users: json['users'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'worth': worth,
        'thumbnail': thumbnail,
        'image': image,
        'description': description,
        'published_date': publishedDate,
        'platforms': platforms,
        'users': users,
      };

  @override
  String toString() =>
      'id: $id, title: $title, worth: $worth, thumbnail: $thumbnail, image: $image, description: $description, published_date: $publishedDate, platforms: $platforms, users: $users';

  static List<Game> parseGame(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Game>((json) => Game.fromJson(json)).toList();
  }
}

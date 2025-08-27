import 'package:hive/hive.dart';

part 'article_model.g.dart';

@HiveType(typeId: 0)
class Article {
  @HiveField(0)
  Source? source;

  @HiveField(1)
  String? author;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? url;

  @HiveField(5)
  String? urlToImage;

  @HiveField(6)
  DateTime? publishedAt;

  @HiveField(7)
  String? content;

  Article({
    this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      url: json['url'],
      title: json['title'],
      urlToImage: json['urlToImage'],
      description: json['description'],
      author: json['author'],
      publishedAt: DateTime.parse(json['publishedAt']),
      source: Source.fromJson(json['source']),
    );
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'title': title,
        'urlToImage': urlToImage,
        'description': description,
        'author': author,
        'source': source != null ? source!.toJson() : null,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Article && runtimeType == other.runtimeType && url == other.url;

  @override
  int get hashCode => url.hashCode;
}

@HiveType(typeId: 1)
class Source {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

import 'dart:convert';

class BusinessFavoritesModel {
  final String userId;
  final bool isFavorite;

  BusinessFavoritesModel({required this.userId, required this.isFavorite});

  factory BusinessFavoritesModel.getNew() {
    return BusinessFavoritesModel(userId: '', isFavorite: false);
  }

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'isFavorite': isFavorite};
  }

  factory BusinessFavoritesModel.fromMap(Map<String, dynamic> json) {
    return BusinessFavoritesModel(
        userId: json['userId'] ?? '', isFavorite: json['isFavorite'] ?? false);
  }
  String toJson() => json.encode(toMap());

  factory BusinessFavoritesModel.fromJson(String source) =>
      BusinessFavoritesModel.fromMap(jsonDecode(source));
}

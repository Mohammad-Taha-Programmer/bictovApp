import 'dart:convert';

class BusinessRatingModel{
  final String userId;
  final double rating;

  BusinessRatingModel({required this.userId, required this.rating});

  factory BusinessRatingModel.getNew(){
    return BusinessRatingModel(userId: '', rating: 0.0);
  }

  Map<String, dynamic> toMap(){
    return {
      'userId' : userId,
      'rating' : rating
    };
  }

  factory BusinessRatingModel.fromMap(Map<String, dynamic> json){
    return BusinessRatingModel(
        userId: json['userId'] ?? '',
        rating: json['rating']?.toDouble() ?? 0.0
    );
  }
  String toJson() => json.encode(toMap());
  factory BusinessRatingModel.fromJson(String source) => BusinessRatingModel.fromMap(jsonDecode(source));
}
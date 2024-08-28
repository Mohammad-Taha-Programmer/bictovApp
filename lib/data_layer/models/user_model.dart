import 'dart:convert';
import 'package:bictov/data_layer/models/business_favorites_model.dart';
import 'package:bictov/data_layer/models/Business_rating_model.dart';

class BictovUser {
 String? userId;
  String? type;
  String? token;
  String? email;
  String? businessName;
  String? businessDescription;
  List<String>? salesTypes;
  String? businessLogo;
  String? profilePicture;
  final String? name;
  final String? phone;
  final String? password;
  final String? gender;
  final String? businessId;
  List<BusinessRatingModel>? rating;
  List<BusinessFavoritesModel>? favorites;

  int? accountAge = 0;

  BictovUser(
      {this.userId,
      this.token,
      this.type,
      required this.name,
      required this.phone,
      required this.password,
      required this.gender,
      this.email,
      this.businessName,
      this.businessDescription,
      this.salesTypes,
      this.businessLogo,
      this.profilePicture,
      this.businessId,
      this.rating,
      this.favorites,
      this.accountAge,
      });

  BictovUser.fullUserData({
    this.userId,
    this.token,
    this.type,
    required this.gender,
    required this.password,
    required this.phone,
    required this.name,
    this.email,
    this.businessName,
    this.businessDescription,
    this.salesTypes,
    this.businessLogo,
    this.profilePicture,
    this.businessId,
    this.rating,
    this.favorites,
    this.accountAge,
  });

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'name': name,
        'phone': phone,
        'password': password,
        'gender': gender,
        'email': email,
        'businessName': businessName,
        'businessDescription': businessDescription,
        'salesTypes': salesTypes,
        'businessLogo': businessLogo,
        'profilePicture': profilePicture,
        'businessId': businessId,
        'rating': rating,
        'favorites' : favorites,
        'accountAge' : accountAge,
      };

  String toJson() => json.encode(toMap());

  factory BictovUser.fromMap(Map<String, dynamic> map) {
    return BictovUser.fullUserData(
        userId: map['_id'] ?? '',
        type: map['type'] ?? '',
        token: map['token'] ?? '',
        name: map['name'] ?? '',
        phone: map['phone'] ?? '',
        password: map['password'] ?? '',
        gender: map['gender'] ?? '',
        email: map['email'] ?? '',
        businessName: map['businessName'] ?? '',
        businessDescription: map['businessDescription'] ?? '',
        salesTypes: List<String>.from(map['salesTypes']) ?? [],
        businessLogo: map['businessLogo'] ?? '',
        profilePicture: map['profilePicture'] ?? '',
        businessId: map['businessId'] ?? '',
       // accountAge: map['accountAge'].toInt(),
        accountAge: int.parse(map['accountAge'] ?? '0'),
        rating: map['rating'] != null
            ? List<BusinessRatingModel>.from(map['rating']
                ?.map((rating) => BusinessRatingModel.fromMap(rating))
                .toList())
            : null,
      favorites: map['favorites'] != null
          ? List<BusinessFavoritesModel>.from(map['favorites']
          ?.map((favorite) => BusinessFavoritesModel.fromMap(favorite))
          .toList())
          : null,
    );
  }

  factory BictovUser.fromJson(String source) => BictovUser.fromMap(json.decode(source));

  factory BictovUser.newEmptyUser() => BictovUser.fullUserData(
      userId: '',
      token: null,
      type: '',
      gender: '',
      password: '',
      phone: '',
      name: '',
      email: '',
      businessName: '',
      businessDescription: '',
      salesTypes: [],
      businessLogo: '',
      profilePicture: '',
      businessId: '',
      accountAge: 0
  );
}

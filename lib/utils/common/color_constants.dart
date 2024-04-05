import 'package:flutter/material.dart';
import 'package:flav/models/house_model.dart';
class ColorConstant {
  static const kDarkBlueColor = Color(0xFF12192b);
  static const kWhiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const kBlackColor = Colors.grey;
  static const kGreyColor = Colors.black;
  static const kGreenColor = Colors.green;
}

class Constants {
  static List<House> houseList = [
    House(
        id: 1,
        price: 90000,
        country: 'Cluj',
        city: 'Cluj-Napoca',
        address: 'Str Eroilor 378',
        bedrooms: 10,
        bathrooms: 2,
        squareMeters: 1.416,
        garages: 2,
        kitchens: 1,
        isFavorite: false
    ),
    House(
        id: 2,
        price: 260000,
        country: 'Gorj',
        city: 'Targu-Jiu',
        address: 'Hidrocentralei',
        bedrooms: 4,
        bathrooms: 4,
        squareMeters: 2.416,
        garages: 3,
        kitchens: 2,
        isFavorite: false
    ),
    House(
        id: 3,
        price: 288000,
        country: 'Gorj',
        city: 'Carbunesti',
        address: 'Str Primaverii 37',
        bedrooms: 1,
        bathrooms: 2,
        squareMeters: 3.416,
        garages: 2,
        kitchens: 1,
        isFavorite: false
    ),
    House(
        id: 4,
        price: 320000,
        country: 'Cluj',
        city: 'Floresti',
        address: 'Calea Floresti 37',
        bedrooms: 2,
        bathrooms: 4,
        squareMeters: 4.416,
        garages: 3,
        kitchens: 2,
        isFavorite: false
    ),
    House(
        id: 5,
        price: 90000,
        country: 'Bistrita-Nasaud',
        city: 'Lunca Ilvei',
        address: 'Str Eroilor 378',
        bedrooms: 1,
        bathrooms: 2,
        squareMeters: 1.416,
        garages: 2,
        kitchens: 1,
        isFavorite: false
    ),
    House(
        id: 6,
        price: 90000,
        country: 'Cluj',
        city: 'Cluj-Napoca',
        address: 'Str Eroilor 378',
        bedrooms: 1,
        bathrooms: 2,
        squareMeters: 1.416,
        garages: 2,
        kitchens: 1,
        isFavorite: false
    ),
    House(
        id: 7,
        price: 90000,
        country: 'Cluj',
        city: 'Cluj-Napoca',
        address: 'Str Eroilor 378',
        bedrooms: 1,
        bathrooms: 2,
        squareMeters: 1.416,
        garages: 2,
        kitchens: 1,
        isFavorite: false
    ),
  ];

  static List<String> imageList = [
    "images/house_1.PNG",
    "images/house_2.PNG",
    "images/house_3.PNG",
    "images/house_4.PNG",
    "images/house_5.PNG",
    "images/house_6.PNG",
    "images/house_7.PNG",

  ];
}





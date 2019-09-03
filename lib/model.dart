import 'package:flutter/material.dart';

class Wine {
  String price;
  String title;
  String subTitle;
  String imgPath;
  Color bgColor;
  int rating;

  Wine(
      {this.price,
      this.title,
      this.subTitle,
      this.imgPath,
      this.bgColor,
      this.rating});
}

var wines = [
  Wine(
      price: '\$1299',
      title: 'Mavrose Rose Wine',
      subTitle: '50%Mavrotragano, 50%Avgoustiatis',
      imgPath: 'assets/mavrose.png',
      bgColor: Color(0xFFFECBC2),
      rating: 5),
  Wine(
      price: '\$999',
      title: 'Heavensake',
      subTitle: 'Junmal Ginjo',
      imgPath: 'assets/heavensake.png',
      bgColor: Color(0xFFB4E8EB),
      rating: 4),
];

var recommendWines = [
  Wine(
      price: '\$49',
      title: 'Bold Smooth Lush',
      subTitle: 'Camofires + Grilled Cheese',
      imgPath: 'assets/canchardonnay.png',
      bgColor: Color(0xFF6CD7DC),
      rating: 5),
  Wine(
      price: '\$669',
      title: 'Bold Smooth Lush',
      subTitle: '70cl Bottle in Giftbox / 40%ABV',
      imgPath: 'assets/gin.png',
      bgColor: Color(0xFFF28E90),
      rating: 4),
];




import 'package:flutter/material.dart';

class MaskModel {
  final String name;
  final String assetname;
  final String description;
  final double price;
  final Color color;

  MaskModel(
      {this.name, this.assetname, this.price, this.description, this.color});
}

List<MaskModel> profList = [
  MaskModel(
    name: "Surgon Mask",
    description: "lorem ipsum",
    assetname: "assets/mask8.png",
    price: 8.0,
    color: Color(0xffbcdaac),
  ),
  MaskModel(
    name: "Student Mask",
    description: "lorem ipsum",
    assetname: "assets/mask4.png",
    price: 8.0,
    color: Color(0xffeaaeaf),
  ),
  MaskModel(
    name: "Doctor Mask",
    description: "lorem ipsum",
    assetname: "assets/mask2.png",
    price: 8.0,
    color: Color(0xffEFDBA9),
  ),
  MaskModel(
    name: "Office Mask",
    description: "lorem ipsum",
    assetname: "assets/mask6.png",
    price: 8.0,
    color: Color(0xffA4afb0),
  ),
];

List<MaskModel> designerList = [
  MaskModel(
    name: "Cultural Mask",
    description: "lorem ipsum",
    assetname: "assets/mask1.png",
    price: 8.0,
    color: Color(0xffFFD0BB),
  ),
  MaskModel(
    name: "Flower Mask",
    description: "lorem ipsum",
    assetname: "assets/mask5.png",
    price: 8.0,
    color: Color(0xffD9D9D9),
  ),
  MaskModel(
    name: "Sclupture Mask",
    description: "lorem ipsum",
    assetname: "assets/mask7.png",
    price: 8.0,
    color: Color(0xffC0EFA9),
  ),
  MaskModel(
    name: "Pink Mask",
    description: "lorem ipsum",
    assetname: "assets/mask3.png",
    price: 8.0,
    color: Color(0xffE9C9F8),
  ),
];

List<String> masks = [
  "assets/mask2.png",
  "assets/mask3.png",
  "assets/mask1.png",
  "assets/mask4.png",
  "assets/mask5.png",
  "assets/mask6.png",
  "assets/mask7.png",
  "assets/mask8.png",
];

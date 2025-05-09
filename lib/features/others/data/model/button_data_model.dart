import 'package:flutter/material.dart';

class ButtonDataModel {
  final String title;
  final Icon? icon;
  final String? imagePath;
  final String? route;

  ButtonDataModel({
    required this.title,
    this.icon,
    this.imagePath,
    this.route,
  });
}
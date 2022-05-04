import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final Icon icon;
  const Category({required this.icon, required this.id, required this.name});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      icon: json['icon'],
      id: json['id'],
      name: json['name'],
    );
  }
  @override
  List<Object?> get props => [id, name, icon];
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgendaCategory {
  // String? name;
  // String? headshots1;
  // String? description;
  // String? time;
  // List<AgendaCategory>? subCategories;
  String name;
  String location;
  String description;
  String datetime_start;
  String datetime_end;
  String price;
  String category_name;
  String speaker_name;
  String speaker_description;

  AgendaCategory({
    required this.name,
    required this.location,
    required this.description,
    required this.datetime_start,
    required this.datetime_end,
    required this.price,
    required this.category_name,
    required this.speaker_name,
    required this.speaker_description,
  });

  factory AgendaCategory.fromJson(Map<String, dynamic> json) {
    return AgendaCategory(
      name: json['name'],
      location: json['location'],
      description: json['description'],
      datetime_start: json['datetime_start'],
      datetime_end: json['datetime_end'],
      price: json['price'],
      category_name: json['category_name'],
      speaker_name: json['speaker_name'],
      speaker_description: json['speaker_description'],
    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<AgendaCategory>> futureCategories;

  Future<List<AgendaCategory>> fetchCategories() async {
    http.Response response = await http
        .get(Uri.parse('http://flutter-api.laraveldaily.com/api/categories'));

    List categories = jsonDecode(response.body);

    return categories
        .map((category) => AgendaCategory.fromJson(category))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    futureCategories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: FutureBuilder<List<AgendaCategory>>(
            future: futureCategories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    AgendaCategory category = snapshot.data![index];
                    return ListTile(title: Text(category.name));
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              return CircularProgressIndicator();
            }));
  }
}

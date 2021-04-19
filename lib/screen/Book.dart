// /*
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';
//
// class Book{
//   final String title;
//   final int id;
//
//   Book({ this.id, this.title});
//
// }
//
// Future<Book> getBooks() async {
//   List<Book> bookList = List();
//
//   final response =
//       await http.get('https://jsonplaceholder.typicode.com/albums');
//
//   if (response.statusCode == 200)
//     bookList = (jsonDecode(response.body) as List).map((e) => new Book.fromJson(e)).toList();
//    else
//     throw Exception('Unable to find Books');
// }
//
//
//
// class Books extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//             child: Text('Books')),
//       ),
//       body: Card(
//         child: ListView.builder(
//             itemBuilder: List.length )
//       ),
//     );
//   }
// }
// */

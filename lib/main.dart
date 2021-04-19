import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'component/Photo.dart';
import 'dart:convert';
import 'screen/Profile.dart';
import 'screen/Book.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.amber,
      fontFamily: 'Georgia',
    ),
    title: 'Basic',
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Photo> list = List();
  var isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("https://jsonplaceholder.typicode.com/photos");
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Photo.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: CircleAvatar(
                radius: 120.0,
                backgroundColor: Colors.lightBlue,
              )),
            decoration: BoxDecoration(color: Colors.amber),
          ),
          ListTile(
            title: Center(child: Text('Home')),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          ListTile(
            title: Center(child: Text('Album')),
            onTap: () {
              print('with in progress');
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Books()));
            },
          ),
          Divider(),
        ],
      )),
      appBar: AppBar(
        title: Center(child: Text('Get Api Data')),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: new Text(list[index].title),
                    trailing: new Image.network(
                      list[index].thumbnailUrl,
                      fit: BoxFit.cover,
                      height: 40.0,
                      width: 40.0,
                    ),
                  ),
                );
              }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          child: new Text("Fetch Data"),
          onPressed: () => _fetchData(),
        ),
      ),
    );
  }
}

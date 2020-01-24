import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'VideoContainer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "http://userapi.tk/youtube/";
  List content;
  Future getData() async {
    final responce = await http.get(
      Uri.encodeFull(url),
    );
    if (mounted) {
      setState(() {
        var converdata = json.decode(responce.body);
        content = converdata;
      });
    }
  }

  load() {
    return SpinKitFadingCircle(
      color: Colors.blue,
      size: 30,
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return content == null
        ? load()
        : SafeArea(
            child: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                title: Image.asset(
                  "images/logo.png",
                  height: 25,
                ),
                floating: true,
                elevation: 3,
                actions: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.videocam)),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.search)),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: CircleAvatar(
                      radius: 12,
                      child: Icon(Icons.person),
                    ),
                  ),
                ],
              ),
              VideoContainer(content)
            ]),
          );
  }
}

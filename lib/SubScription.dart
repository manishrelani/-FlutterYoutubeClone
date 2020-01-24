import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_clone/VideoContainer.dart';

class SubScription extends StatefulWidget {
  @override
  _SubScriptionState createState() => _SubScriptionState();
}

class _SubScriptionState extends State<SubScription> {
  final url = "http://userapi.tk/youtube/subscription";
  List data;
  Future getData() async {
    final responce = await http.get(
      Uri.encodeFull(url),
    );
    if (mounted) {
      setState(() {
        var converdata = json.decode(responce.body);
        data = converdata;
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
    return data == null
        ? load()
        : SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
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
                    )
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    status(),
                  ]),
                ),
                VideoContainer(data)
              ],
            ),
          );
  }

  Widget status() {
    return Container(
      height: 80,
      child: ListView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 7),
            child: CircleAvatar(
              radius: 30,
              child: data[index]["ProfileiconURL"] == null
                  ? load()
                  : Image.network(
                      data[index]["ProfileiconURL"],
                      fit: BoxFit.fill,
                    ),
            ),
          );
        },
      ),
    );
  }
}

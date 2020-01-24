import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import 'VideoContainer.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  String url = "http://userapi.tk/youtube/trending";

  List data;
  Future getData() async {
    var responce = await http.get(
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
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(
                  "images/music.jpeg",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 12, left: 8, right: 8),
              child: Text("Music"),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(
                  "images/gaming.jpeg",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 12, left: 8, right: 8),
              child: Text("Gaming"),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(
                  "images/news.jpeg",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 12, left: 8, right: 8),
              child: Text("News"),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(
                  "images/movies.jpeg",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 12, left: 8, right: 8),
              child: Text("Movies"),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(
                  "images/fashion.jpeg",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 12, left: 8, right: 8),
              child: Text("Fashion"),
            )
          ],
        ),
      ],
    );
  }
}

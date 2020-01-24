//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'VideoPlay.dart';

//import 'package:flutter_spinkit/flutter_spinkit.dart';

class VideoContainer extends StatefulWidget {
  final data;
  VideoContainer(this.data);
  @override
  _VideoContainerState createState() => _VideoContainerState(data);
}

class _VideoContainerState extends State<VideoContainer> {
  final data;
  _VideoContainerState(this.data);

  load() {
    return SpinKitFadingCircle(
      color: Colors.blue,
      size: 40,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Column(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                        height: 200,
                        width: double.infinity,
                        child: data[index]["ThumbmnilURL"] == null
                            ? load()
                            : Image.network(
                                data[index]["ThumbmnilURL"],
                                fit: BoxFit.fill,
                              )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoPlay(data, index)));
                    },
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 15, 0, 4),
                    height: 65,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  NetworkImage(data[index]["ProfileiconURL"])),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                          width: MediaQuery.of(context).size.width * 0.77,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Wrap(children: <Widget>[
                                Text(
                                  data[index]["Title"],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                child: Row(
                                  children: <Widget>[
                                    Text(data[index]["Name"],
                                        style: TextStyle(fontSize: 12)),
                                    Text(" • ${data[index]["Views"]} ",
                                        style: TextStyle(fontSize: 12)),
                                    Text("• ${data[index]["Day"]} ",
                                        style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Icon(
                            Icons.more_vert,
                            size: 19,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          childCount: data.length),
    );
  }
}

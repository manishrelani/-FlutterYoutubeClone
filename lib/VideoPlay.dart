import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';
import 'package:share/share.dart';

class VideoPlay extends StatefulWidget {
  final data, index;
  VideoPlay(this.data, this.index);
  @override
  _VideoPlayState createState() => _VideoPlayState(data, index);
}

class _VideoPlayState extends State<VideoPlay> {
  final data, index;
  _VideoPlayState(this.data, this.index);
  VideoPlayerController controller;

  @override
  void initState() {
    var url = data[index]["VideoURL"];
    var sub = "https" + url.substring(4);
    print(sub);
    controller = VideoPlayerController.network(sub)
      ..initialize().then((_) {
        setState(() {
          controller.play();
        });
      });
    super.initState();
  }

  load() {
    return SpinKitFadingCircle(
      color: Colors.blue,
      size: 40,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: data == null
            ? load()
            : Column(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: data[index]["VideoURL"] == null
                          ? load()
                          : controller.value.initialized
                              ? AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                  child: VideoPlayer(controller),
                                )
                              : Container(),
                    ),
                    onTap: () {
                      setState(() {
                        controller.value.isPlaying
                            ? controller.pause()
                            : controller.play();
                      });
                    },
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        details(),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: <Widget>[
                                  Container(
                                      height: 200,
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.pause();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoPlay(data, index)),
                                          );
                                        },
                                        child: Image(
                                          width: double.infinity,
                                          image: NetworkImage(
                                              data[index]['ThumbmnilURL']),
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundImage: NetworkImage(
                                                data[index]['ProfileiconURL']),
                                          )),
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 72,
                                                            bottom: 6,
                                                            top: 10),
                                                    child: Text(
                                                      "${(data[index]['Title'])}",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: Text(
                                                        "${data[index]['Name']}  ·  ${data[index]['Views']}  ·  ${data[index]['Day']}"),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        color: Colors.grey,
                                        icon: Icon(Icons.more_vert),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget details() {
    return Column(children: <Widget>[
      Wrap(
        children: <Widget>[
          ListTile(
            title: Text(
              data[index]["Title"],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.5,
              ),
            ),
            trailing: Icon(Icons.arrow_drop_down, color: Colors.grey),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.5),
              child: Text(data[index]["Views"]),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Icon(Icons.thumb_up, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "4M",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          GestureDetector(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Icon(Icons.screen_share, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "share",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Share.share(data[index]["VideoURL"]);
              }),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Icon(Icons.file_download, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Download",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Icon(Icons.library_add, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Icon(Icons.thumb_down, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("10.5 K"),
              ),
            ],
          ),
        ],
      ),
      Container(
        height: 2,
        color: Colors.grey[300],
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(data[index]["ProfileiconURL"]),
        ),
        title: Text(data[index]["Name"]),
        subtitle: Text("24.9M subscriber"),
        trailing: Text(
          "SUBSCRIBE",
          style: TextStyle(
            color: Colors.red[800],
            fontWeight: FontWeight.bold,
            fontSize: 17,
            letterSpacing: 1,
          ),
        ),
      )
    ]);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

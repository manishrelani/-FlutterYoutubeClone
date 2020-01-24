import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Image.asset(
              "images/logo.png",
              height: 25,
            ),
            floating: true,
            elevation: 10,
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
            ListTile(
              leading: Icon(
                Icons.history,
                size: 28,
              ),
              title: Text("History", style: TextStyle(fontSize: 16)),
            ),
            ListTile(
              leading: Icon(
                Icons.file_download,
                size: 28,
              ),
              title: Text(
                "Download",
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text("20 recommendations"),
            ),
            ListTile(
              leading: Icon(
                Icons.play_circle_outline,
                size: 28,
              ),
              title: Text(
                "My Videos",
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.local_offer,
                size: 28,
              ),
              title: Text(
                "Purchases",
                style: TextStyle(fontSize: 17),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.watch_later,
                size: 28,
              ),
              title: Text(
                "Watch Later",
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text("23 unwatched videos"),
            ),
            ListTile(
              leading: Icon(
                Icons.brightness_4,
                size: 28,
              ),
              title: Text(
                "Change Theme",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                changeBrightness();
              },
            ),
            Container(
              height: 0.60,
              width: double.infinity,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Playlists"),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Recently added "),
                )
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.add,
                color: Colors.blue[800],
              ),
              title: Text(
                "Liked Videos",
                style: TextStyle(
                    color: Colors.blue[800], fontWeight: FontWeight.bold),
              ),
              subtitle: Text("680 Videos"),
            ),
            ListTile(
              leading: Image(
                height: 150,
                width: 80,
                image: NetworkImage(
                    "https://4.bp.blogspot.com/-46z2lhOaFVo/Xebu0OPEPhI/AAAAAAAAIJU/K8usH-qTwckL3a8-ldDRAeJaeQBnqxi9gCLcBGAsYHQ/s1600/Blog_Header.png"),
              ),
              title: Text("Flutter Videos Tutorial in English"),
              subtitle: Text("Smartherd - 34 Videos"),
            ),
            ListTile(
              leading: Image(
                height: 150,
                width: 80,
                image: NetworkImage(
                    "https://4.bp.blogspot.com/-46z2lhOaFVo/Xebu0OPEPhI/AAAAAAAAIJU/K8usH-qTwckL3a8-ldDRAeJaeQBnqxi9gCLcBGAsYHQ/s1600/Blog_Header.png"),
              ),
              title: Text("Theory of Computation TE Computer SPPU"),
              subtitle: Text("Technical Solution - 34 Videos"),
            ),
            ListTile(
              leading: Image(
                height: 150,
                width: 80,
                image: NetworkImage(
                    "https://4.bp.blogspot.com/-46z2lhOaFVo/Xebu0OPEPhI/AAAAAAAAIJU/K8usH-qTwckL3a8-ldDRAeJaeQBnqxi9gCLcBGAsYHQ/s1600/Blog_Header.png"),
              ),
              title: Text("Computer Network Practical 2020"),
              subtitle: Text("Naresh it Hyderabad - 19 Videos"),
            ),
            ListTile(
              leading: Image(
                height: 150,
                width: 80,
                image: NetworkImage(
                    "https://4.bp.blogspot.com/-46z2lhOaFVo/Xebu0OPEPhI/AAAAAAAAIJU/K8usH-qTwckL3a8-ldDRAeJaeQBnqxi9gCLcBGAsYHQ/s1600/Blog_Header.png"),
              ),
              title: Text("LCO Flutter Bootcamp 2020 Jaipur"),
              subtitle: Text("Learncodeonline - 19 Videos"),
            ),
          ]))
        ],
      ),
    );
  }
}

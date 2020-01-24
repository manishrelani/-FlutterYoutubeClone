import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
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
            raw(),
            raw(),
            raw(),
            raw(),
            raw(),
            raw(),
            raw(),
            raw(),
            raw(),
            raw()
          ]))
        ],
      ),
    );
  }

  Widget raw() {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 12, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 13),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    "https://www.collegesearch.in/upload/institute/images/large/131106110233_54.jpg"),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.49,
                child: Wrap(
                  children: <Widget>[
                    Text(
                        "Google Developer Updated: DSC Soluction Challange- How to identfy a problem"),
                  ],
                ),
              ),
              Container(
                height: 20,
                width: 166,
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Text(
                    "7 hours ago",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 0, 20, 0),
            height: 45,
            width: MediaQuery.of(context).size.width * 0.17,
            child: Image.network(
              "https://image.winudf.com/v2/image/Y29tLnB5dG9uZWRzZmpzZGxzZGxmZXIuZmVydmZzZGZld3Jld2ZzZGZfc2NyZWVuXzZfMTUyNTgzOTg0M18wMDM/screen-6.jpg?fakeurl=1&type=.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Icon(Icons.more_vert)
        ],
      ),
    );
  }
}

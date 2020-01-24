import 'package:flutter/material.dart';

import 'package:dynamic_theme/dynamic_theme.dart';

import 'HomePage.dart';
import 'InboxPage.dart';
import 'LibraryPage.dart';
import 'SubScription.dart';
import 'Trending.dart';

main() => runApp(DynamicTheme(
    defaultBrightness: Brightness.light,
    data: (brightness) => new ThemeData(
          primaryColor: Colors.white,
          brightness: brightness,
        ),
    themedWidgetBuilder: (context, theme) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: MyApp(),
      );
    }));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectPage = 0;
  final activity = [
    HomePage(),
    TrendingPage(),
    SubScription(),
    InboxPage(),
    LibraryPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: activity[selectPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectPage,
        onTap: (int index) {
          setState(() {
            selectPage = index;
          });
        },
        fixedColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text('Trending'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            title: Text('Subscription'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            title: Text('Inbox'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            title: Text('Library'),
          ),
        ],
      ),
    );
  }
}


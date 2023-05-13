import 'dart:ffi';

import 'package:first_flutter/present/favorite_fragment.dart';
import 'package:first_flutter/present/list_fragment.dart';
import 'package:first_flutter/present/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'value.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<BottomNavProvider>(
          create: (context) => BottomNavProvider()),
      ChangeNotifierProvider<ListFragmentProvider>(
          create: (context) => ListFragmentProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

/*
class ItemTitle extends StatelessWidget {
  String _name = "";

  ItemTitle(this._name);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_name),
    );
  }
}

 */
/*
class FlutterRecyclerView extends StatelessWidget {
  var _itemList = List.filled(100, ItemTitle("jdm"));
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return Text("가나다");
        }
    );
  }
}

 */

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BottomNavProvider _bottomNavProvider;
  final _fragmentList = <Widget>[
    ListFragmentWidget(),
    FavoriteFragmentWidget()
  ];

  @override
  Widget build(BuildContext context) {
    _bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: _fragmentList.elementAt(_bottomNavProvider.tab),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: Strings.list),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: Strings.favorite)
          ],
          currentIndex: _bottomNavProvider.tab,
          selectedItemColor: Colors.lightBlue,
          onTap: (int index) {
            setState(() {
              _bottomNavProvider.setTab(index);
            });
          },
        ));
  }
}

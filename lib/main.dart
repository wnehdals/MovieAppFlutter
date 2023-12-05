import 'package:first_flutter/present/provider/router_provider.dart';
import 'package:first_flutter/present/res/colors.dart';
import 'package:first_flutter/present/utils/state_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter()
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      observers: [StateLogger()],
        child: MyApp()
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme(
              primary: ContextColors.black,
              onPrimary: ContextColors.white,
              secondary: ContextColors.blue400,
              onSecondary: ContextColors.blue50,
              error: ContextColors.red400,
              onError: ContextColors.red50,
              background: ContextColors.white,
              onBackground: ContextColors.gray50,
              surface: ContextColors.white,
              onSurface: ContextColors.black,
              brightness: Brightness.light),
          useMaterial3: true,
        ),
    );
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
/*
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

 */

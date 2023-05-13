
import 'package:first_flutter/data/datasources/remote_movie_datasource.dart';
import 'package:first_flutter/present/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/enum.dart';
import '../data/model/movie_model.dart';

class ListFragmentWidget extends StatefulWidget {
  const ListFragmentWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ListFragmentState();

}
class _ListFragmentState extends State<ListFragmentWidget> {
  late List<Search> searchList;
  late ListFragmentProvider _listFragmentProvider;
  List<Search> items = [];
  @override
  void initState() {
    _listFragmentProvider = Provider.of<ListFragmentProvider>(context, listen: false);
    _listFragmentProvider.getSearchList("king", 1);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<ListFragmentProvider>(builder: (context, item, child) {
        if (item.status == Status.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (item.status == Status.success) {
          items = item.searchList;
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          Image.network(
                            items[index].poster.toString(),
                            height: 60,
                            width: 60,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(child: Text(
                            items[index].title.toString(),
                            style: const TextStyle(
                              color: Colors.black, fontSize: 18
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                }
            ),
          );
        }  else if (item.status == Status.noInternet) {
          return Material(
            child: Center(
              child: Text('No internet Connection'),
            ),
          );
        }else if (item.status == Status.none) {
          return Material(
            child: Center(
              child: Text('Wel come'),
            ),
          );
        } else {
          return Material(
            child: Center(
              child: Text('API Call Error'),
            ),
          );
        }
      }),
    );
    return Container(

      width: double.infinity,
      height: double.infinity,
      color: Colors.green,
      child: Text("df")
    );
  }

  /*
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _listProvider = Provider.of<ListFragmentProvider>(context);
    print("didchange");
    _listProvider.fetchSearchList('king', 1);
  }

   */

}
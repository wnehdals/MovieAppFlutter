import 'package:first_flutter/present/layout/default_layout.dart';
import 'package:first_flutter/present/widget/edit_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/movie_card.dart';
import '../widget/poster.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<MovieCard> data = [
    MovieCard(id: '9', poster: "", rank: 2, title: "ssdf", isFavorite: false),
    MovieCard(id: '9', poster: "", rank: 2, title: "ssdf", isFavorite: false),
    MovieCard(id: '9', poster: "", rank: 2, title: "ssdf", isFavorite: false),
    MovieCard(id: '9', poster: "", rank: 2, title: "ssdfsadfasdfasdfasdfasdfasdfsdf", isFavorite: false),
    MovieCard(id: '9', poster: "", rank: 2, title: "ssdf", isFavorite: false),
    MovieCard(id: '9', poster: "", rank: 2, title: "ssdf", isFavorite: true),
    MovieCard(id: '9', poster: "", rank: 2, title: "ssdf", isFavorite: false),
    MovieCard(id: '9', poster: "", rank: 2, title: "ssdf", isFavorite: false),
    MovieCard(id: '9', poster: "", rank: 2, title: "ssdf", isFavorite: false),
    MovieCard(id: '9', poster: "", rank: 2, title: "ssdf", isFavorite: false),
  ];

  @override
  void initState() {
    super.initState();
  }

  void onClickSearch() {}

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: Column(
      children: [
        EditText(
          suffixClickListener: onClickSearch,
          textEditingController: searchController,
          suffixIcon: 'assets/images/ic_search_black.svg',
          textInputAction: TextInputAction.search,
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
        ),
        Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  childAspectRatio: 2/3),
                  itemBuilder: (BuildContext context, int index) {
                    return Poster(
                      title: data.elementAt(index).title,
                      imgUrl: data.elementAt(index).poster,
                      isFavorite: data.elementAt(index).isFavorite,
                      favoriteClickListener: () {},
            );
          },
        )
            )
        )
      ],
    ));
  }
}

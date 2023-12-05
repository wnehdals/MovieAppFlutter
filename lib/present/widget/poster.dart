import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_flutter/present/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  String title;
  String imgUrl;
  bool isFavorite;
  VoidCallback favoriteClickListener;

  Poster(
      {Key? key,
      required this.title,
      required this.imgUrl,
      required this.isFavorite,
      required this.favoriteClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: ContextColors.gray400,
            ),
            borderRadius: BorderRadius.circular(8)), //  P
        child: Container(
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CachedNetworkImage(
                    imageUrl:
                    'https://m.media-amazon.com/images/M/MV5BMTk4MTk1NjI0OV5BMl5BanBnXkFtZTcwNDQxOTUyMQ@@._V1_SX300.jpg',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          )),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),

              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                        title,
                        style:
                        const TextStyle(color: ContextColors.black, fontSize: 14),
                      )),
                  IconButton(
                      onPressed: favoriteClickListener,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: ContextColors.red400,
                        size: 24,
                      ))
                ],
              )

            ],
          ),
        ));
  }
}

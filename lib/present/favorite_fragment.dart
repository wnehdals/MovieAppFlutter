
import 'package:flutter/material.dart';

class FavoriteFragmentWidget extends StatefulWidget {
  const FavoriteFragmentWidget({super.key});




  @override
  State<StatefulWidget> createState() => _FavoriteFragmentState();
}
class _FavoriteFragmentState extends State<FavoriteFragmentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.deepPurpleAccent,
      child: Text("second"),
    );
  }

}
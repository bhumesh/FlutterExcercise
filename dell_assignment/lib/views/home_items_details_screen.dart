import 'package:flutter/material.dart';
import 'package:dell_assignment/model/home_model.dart';


class HomeItemDetailsPage extends StatefulWidget {
  final Items data;
  const HomeItemDetailsPage({this.data});

  @override
  _HomeItemDetailsPageState createState() => _HomeItemDetailsPageState();
}

class _HomeItemDetailsPageState extends State<HomeItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
    );
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dell_assignment/model/home_model.dart';

class HomeViewModel extends GetxController {
  HomeModel data;
  Future<String> getHomeItems() async {
    var jsonText = await rootBundle.loadString('assets/home.json');
    data = HomeModel.fromJson(json.decode(jsonText));
    update();
    return 'success';
  }
}
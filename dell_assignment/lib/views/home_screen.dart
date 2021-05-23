import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dell_assignment/views/home_items_details_screen.dart';
import 'package:dell_assignment/view_models/home_view_model.dart';
import 'package:get/get.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeViewModel viewModel;
  List<Widget> imageSliders;
  @override
  void initState() {
    viewModel = Get.put(HomeViewModel());
    viewModel.getHomeItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: GetBuilder<HomeViewModel>(
        init: viewModel,
        builder: (_) {
          imageSliders = viewModel.data.items
        .map((item) => Container(
              child: InkWell(
                onTap: () {
                  Get.to(HomeItemDetailsPage(data: item.details));
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(1.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.network(item.url,
                              fit: BoxFit.cover, width: 1000.0),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Text(
                                "${item.header}\n${item.description}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ))
        .toList();
          return Padding(
            padding: const EdgeInsets.only(top: 250.0),
            child: Container(
                child: Column(
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
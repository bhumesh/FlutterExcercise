import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dell_assignment/model/home_model.dart';
import 'package:dell_assignment/views/home_items_details_notes_screen.dart';

class HomeItemDetailsPage extends StatefulWidget {
  final List<Details> data;
  const HomeItemDetailsPage({this.data});

  @override
  _HomeItemDetailsPageState createState() => _HomeItemDetailsPageState();
}

class _HomeItemDetailsPageState extends State<HomeItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(''),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
              Icons.arrow_back_ios,
            ),
        ),
      ),
      backgroundColor: Colors.grey,
      body: _buildDetail(),
    );
  }

  Widget _buildDetail() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: widget.data.length,
        itemBuilder: (context, i) {
          return _buildDetailItem(widget.data[i]);
        }
    );
  }

  Widget _buildDetailItem(Details detail) {
    return Container(
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      final HomeItemDetailNotePage page = HomeItemDetailNotePage(noteId: detail.id);
                      Get.to(page);
                    },
                    child: Image.network(
                      detail.url,
                      fit: BoxFit.fill,
                      height: 250,
                      ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 30),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: detail.notes.length,
                    itemBuilder: (context, index) {
                      return Text("${index+1}. ${detail.notes[index]}");
                  },
                ),
              ],
            ),
        );
  }
}

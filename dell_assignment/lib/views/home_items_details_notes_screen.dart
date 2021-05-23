import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dell_assignment/model/home_item_details_note.dart';
import 'package:dell_assignment/view_models/home_item_detail_view_model.dart';
import 'package:dell_assignment/views/web_view_screen.dart';

class HomeItemDetailNotePage extends StatefulWidget {
  final String noteId;
  const HomeItemDetailNotePage({this.noteId});

  @override
  _HomeItemDetailNotePageState createState() => _HomeItemDetailNotePageState();
}

class _HomeItemDetailNotePageState extends State<HomeItemDetailNotePage> {

  HomeDetailNoteViewModel viewModel = Get.put(HomeDetailNoteViewModel());
  List<ItemsNotes> itemsNotes;

  @override
  void initState() {
    super.initState();
    new Future<String>.delayed(new Duration(seconds: 1), () => viewModel.getNotesItems(widget.noteId).then((String value) {
      setState(() {
        itemsNotes = viewModel.data.itemsNotes;
      });
    }));
  }
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
      body: _buildNotesList(),
    );
  }

  Widget _buildNotesList() {
    if (viewModel.data == null) {
      return Text("Loading");
    } else {
      return ListView.builder(
          itemCount: itemsNotes.length,
          itemBuilder: (context, i) {
            return _buildDetailItem(itemsNotes[i]);
          }
      );
    }
  }

  Widget _buildDetailItem(ItemsNotes note) {
    return ListTile(
      title: Text(
        note.text,
        style: TextStyle(fontSize: 16.0),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      onTap: () {
        print("${note.url} clicked");
        Get.to(InAppBrowser(webUrl: note.url));
      },
    );
  }
}

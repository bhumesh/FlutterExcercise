import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dell_assignment/model/home_item_details_note.dart';


class HomeDetailNoteViewModel extends GetxController {
  HomeItemNote data;
  Future<String> getNotesItems(String id) async {
    var jsonText = await rootBundle.loadString('assets/details_notes.json');
    data = HomeItemNote.fromJson(json.decode(jsonText));
    data.itemsNotes.removeWhere((element) => element.id != id);
    update();
    return 'success';
  }
}
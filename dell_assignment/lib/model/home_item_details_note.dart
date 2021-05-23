class HomeItemNote {
  List<ItemsNotes> itemsNotes;

  HomeItemNote({this.itemsNotes});

  HomeItemNote.fromJson(Map<String, dynamic> json) {
    if (json['itemsNotes'] != null) {
      itemsNotes = new List<ItemsNotes>();
      json['itemsNotes'].forEach((v) {
        itemsNotes.add(new ItemsNotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemsNotes != null) {
      data['itemsNotes'] = this.itemsNotes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemsNotes {
  String text;
  String url;
  String id;

  ItemsNotes({this.text, this.url, this.id});

  ItemsNotes.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['url'] = this.url;
    data['id'] = this.id;
    return data;
  }
}
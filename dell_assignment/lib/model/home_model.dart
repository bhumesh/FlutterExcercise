class HomeModel {
  List<Items> items;

  HomeModel({this.items});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String url;
  String header;
  String description;
  List<Details> details;

  Items({this.url, this.header, this.description, this.details});

  Items.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    header = json['header'];
    description = json['description'];
    if (json['details'] != null) {
      details = new List<Details>();
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['header'] = this.header;
    data['description'] = this.description;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String url;
  List<String> notes;
  String id;

  Details({this.url, this.notes, this.id});

  Details.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    notes = json['notes'].cast<String>();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['notes'] = this.notes;
    data['id'] = this.id;
    return data;
  }
}
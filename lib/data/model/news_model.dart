/// userId : 1
/// id : 1
/// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
/// body : "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"

class NewsModel {
  int _page;
  int _per_page;
  int _total;
  int _total_pages;
  List<NewsDataModel> data;

  int get page => _page;
  int get per_page => _per_page;
  int get total => _total;
  int get total_pages => _total_pages;

  NewsModel({int page, int per_page, int total, int total_pages}) {
    _page = page;
    _per_page = per_page;
    _total = total;
    _total_pages = total_pages;
  }

  NewsModel.fromJson(dynamic json) {
    _page = json["page"];
    _per_page = json["per_page"];
    _total = json["total"];
    _total_pages = json["total_pages"];
    if (json['data'] != null) {
      data = new List<NewsDataModel>();
      json['data'].forEach((v) {
        data.add(new NewsDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page"] = _page;
    map["per_page"] = _per_page;
    map["total"] = _total;
    map["total_pages"] = _total_pages;
    final Map<String, dynamic> dataa = new Map<String, dynamic>();
    if (this.data != null) {
      dataa["data"] = this.data.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class NewsDataModel {
  int _id;
  String _email;
  String _first_name;
  String _last_name;
  String _avatar;

  int get id => _id;
  String get email => _email;
  String get first_name => _first_name;
  String get last_name => _last_name;
  String get avatar => _avatar;

  NewsDataModel(
      {int id,
      String email,
      String first_name,
      String last_name,
      String avatar}) {
    _id = id;
    _email = email;
    _first_name = first_name;
    _last_name = last_name;
    _avatar = avatar;
  }

  NewsDataModel.fromJson(dynamic json) {
    _id = json["id"];
    _email = json["email"];
    _first_name = json["first_name"];
    _last_name = json["last_name"];
    _avatar = json["avatar"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["email"] = _email;
    map["first_name"] = _first_name;
    map["last_name"] = _last_name;
    map["avatar"] = _avatar;
    return map;
  }
}

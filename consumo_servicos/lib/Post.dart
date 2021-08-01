import 'dart:convert';

class Post{
  int? _userId;
  int? _id;
  String? _title;
  String? _body;

  Post.empty(){}
  Post(this._userId, this._id, this._title, this._body);

  toEntityFromJson(){
    return json.encode(
        {
          "userId": this.userId,
          "id": this.id,
          "title": this.title,
          "body": this.body
        }
    );
  }

  Map fromEntityToJson(){
    return {
      "userId": this.userId,
      "id": this.id,
      "title": this.title,
      "body": this.body
    };
  }

  int? get id => _id;
  int? get userId => _userId;
  String? get title => _title;
  String? get body => _body;

  set userId(int? value) {
    _userId = value;
  }
  set id(int? value) {
    _id = value;
  }
  set title(String? value) {
    _title = value;
  }
  set body(String? value) {
    _body = value;
  }
}
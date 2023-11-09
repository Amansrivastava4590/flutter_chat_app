class PeopleModel {
  int? id;
  String? firstName;
  String? lastName;
  String? msg;
  String? date;
  String? count;
  bool? story;
  String? image;
  String? avatar;
  String? status;
  List<String>? stories;

  PeopleModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.msg,
        this.date,
        this.count,
        this.story,
        this.image,
        this.avatar,
        this.status,
        this.stories});

  PeopleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    msg = json['msg'];
    date = json['date'];
    count = json['count'];
    story = json['story'];
    image = json['image'];
    avatar = json['avatar'];
    status = json['status'];
    stories = json['stories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['msg'] = this.msg;
    data['date'] = this.date;
    data['count'] = this.count;
    data['story'] = this.story;
    data['image'] = this.image;
    data['avatar'] = this.avatar;
    data['status'] = this.status;
    data['stories'] = this.stories;
    return data;
  }
}
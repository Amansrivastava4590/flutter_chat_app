class ChatModel {
  int? id;
  String name;
  String avatar;
  String msg;
  String date;
  String count;
  bool story;
  List<dynamic> stories;
  bool opened;
  String type;

  ChatModel(
      {this.id,
      required this.name,
      required this.avatar,
      required this.msg,
      required this.date,
      required this.count,
      required this.story,
      required this.stories,
      required this.opened,
      required this.type});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      msg: json['msg'],
      date: json['date'],
      count: json['count'],
      story: json['story'],
      stories: json['stories'],
      opened: json['opened'],
      type: json['type']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'msg': msg,
      'date': date,
      'count': count,
      'story': story,
      'stories': stories,
      'opened': opened,
      'type': type
    };
  }
}

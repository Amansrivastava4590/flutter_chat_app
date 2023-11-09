class MessageModel {
  String image;
  String msg;
  bool sender;
  String type;
  bool opened;

  MessageModel(
      {
        required this.image,
        required this.msg,
        required this.sender,
        required this.opened,
        required this.type});

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
      image: json['image'],
      msg: json['msg'],
      sender: json['sender'],
      opened: json['opened'],
      type: json['type']);

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'msg': msg,
      'sender': sender,
      'opened': opened,
      'type': type
    };
  }
}

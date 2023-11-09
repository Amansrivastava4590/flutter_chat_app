class CallModel {
  int? id;
  String? name;
  String? avatar;
  String? date;
  String? outbound;
  String? count;
  String? type;

  CallModel(
      {this.id,
        this.name,
        this.avatar,
        this.date,
        this.outbound,
        this.count,
        this.type});

  CallModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    date = json['date'];
    outbound = json['outbound'];
    count = json['count'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['date'] = this.date;
    data['outbound'] = this.outbound;
    data['count'] = this.count;
    data['type'] = this.type;
    return data;
  }
}

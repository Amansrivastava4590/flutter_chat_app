class meModel {
  final String username;
  final String email;
  final String avatar;
  final bool story;
  final String status;
  final List<dynamic> stories;

  meModel(
      {required this.username,
      required this.email,
      required this.avatar,
      required this.story,
      required this.status,
      required this.stories});

  factory meModel.fromJson(Map<String, dynamic> data) => meModel(
      username: data['username'],
      email: data['email'],
      avatar: data['avatar'],
      story: data['story'],
      status: data['status'],
      stories: data['stories']);
}

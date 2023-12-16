class meModel {
  final String username;
  final String email;
  final String avatar;
  final bool story;
  final String status;
  final List<dynamic>? friends ;
  final List<dynamic> stories;

  meModel(
      {required this.username,
      required this.email,
      required this.avatar,
      required this.story,
      required this.status,
        this.friends,
      required this.stories});

  factory meModel.fromJson(Map<String, dynamic> data) => meModel(
      username: data['username'],
      email: data['email'],
      avatar:data.containsKey("avatar")? data['avatar'] :null,
      story: data.containsKey("story")?data['story']:null,
      status: data.containsKey("status")?data['status']:null,
      stories:data.containsKey("stories")? data['stories']:null,
    friends: data.containsKey("friends")? data['friends']: null,
  );
}

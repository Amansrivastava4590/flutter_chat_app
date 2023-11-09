import 'package:fluuter_chat_app/model/story_model.dart';

class UserModel {
  final String userName;
  final String imageUrl;
  final List<StoryModel> stories;

  UserModel(this.userName, this.imageUrl, this.stories);
}
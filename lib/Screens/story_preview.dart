

import 'package:flutter/cupertino.dart';

import '../model/user_model.dart';

class StoryPreview extends StatefulWidget {
  final pageIndex;
  final List<UserModel> users;
  const StoryPreview({Key? key, this.pageIndex, required this.users}) : super(key: key);

  @override
  State<StoryPreview> createState() => _StoryPreviewState();
}

class _StoryPreviewState extends State<StoryPreview> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_chat_app/global.dart';
import 'package:story/story_page_view.dart';

import '../model/user_model.dart';

class StoryPreview extends StatefulWidget {
  final pageIndex;
  final List<UserModel> users;
  const StoryPreview({Key? key, this.pageIndex, required this.users})
      : super(key: key);

  @override
  State<StoryPreview> createState() => _StoryPreviewState(pageIndex, users);
}

class _StoryPreviewState extends State<StoryPreview> {
  final pageIndex;
  final List<UserModel> sampleUsers;
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  _StoryPreviewState(this.pageIndex, this.sampleUsers);

  @override
  void initState() {
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
    // TODO: implement initState
    super.initState();
  }

  static Route<void> _modelBuilder(BuildContext context,Object? arguments) =>
      CupertinoModalPopupRoute(builder: (BuildContext context)=>
          CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(child: Text("Cancel"),onPressed: () => pop(context),),
            actions: [
              CupertinoActionSheetAction(child: Text("Report"),onPressed: ()=> pop(context)),
              CupertinoActionSheetAction(child: Text("Mute"),onPressed: () => pop(context),),

            ],
          ));
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: StoryPageView(
        itemBuilder: (BuildContext context, int pageIndex, int storyIndex) {
          final user = sampleUsers[pageIndex];
          final story = user.stories[storyIndex];
          return Stack(
            children: [
              Positioned.fill(
                  child: Container(
                color: CupertinoColors.black,
              )),
              Positioned.fill(
                  child: Image.network(
                story.imageUrl,
                fit: BoxFit.cover,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 40, bottom: 10),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(user.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      user.userName,
                      style: TextStyle(
                          fontSize: 17,
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          );
        },
        gestureItemBuilder:
            (BuildContext context, int pageIndex, int storyIndex) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: CupertinoButton(
                      child: Icon(
                        CupertinoIcons.clear,
                        color: Colors.white,
                      ),
                      onPressed: () => pop(context)),
                ),
              ),
              Positioned(
                right: 40,
                top: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: CupertinoButton(child: Icon(CupertinoIcons.ellipsis,color: Colors.white,), onPressed: () => Navigator.of(context).restorablePush(_modelBuilder)),
                ),
              )
            ],
          );
        },
        storyLength: (int pageIndex) {
          return sampleUsers[pageIndex].stories.length;
        },
        pageLength: sampleUsers.length,
        initialStoryIndex: (int pageIndex) {
          return 0;
        },
        initialPage: this.pageIndex,
        onPageLimitReached: () {
          pop(context);
        },
        indicatorAnimationController: indicatorAnimationController,
      ),
    ));

  }
}

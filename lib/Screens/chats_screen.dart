import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_chat_app/Screens/messages.dart';
import 'package:fluuter_chat_app/Screens/story_preview.dart';
import 'package:fluuter_chat_app/components/list_tile_chat.dart';
import 'package:fluuter_chat_app/components/search_bar.dart';
import 'package:fluuter_chat_app/global.dart';
import 'package:fluuter_chat_app/model/chat_model.dart';
import 'package:fluuter_chat_app/model/story_model.dart';
import 'package:fluuter_chat_app/model/user_model.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: FutureBuilder<List<ChatModel>>(
          future: Whatsapp.Chats(),
          builder: (context, snapshot) {
            return CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: Text('Chats'),
                ),
                SearchBar(
                  onChanged: (){},
                  onSubmitted: (){},
                ),

                snapshot.hasData ?
                SliverList(
                    delegate: SliverChildListDelegate(
                        snapshot.data!.map((e) => ListTileChat(
                          key: UniqueKey(),
                          count: e.count,
                          onTap: () =>  navigate(context,MessageBoxScreen(contact: e.name,)),
                          subtitle: e.msg,
                          title: e.name,
                          date: e.date,
                          image: e.avatar,
                          border: e.story,
                          onImageTap: ()  {
                            if(!e.story) return;
                            List<UserModel> sampleUsers=[];
                            List<StoryModel> stories =[];

                            stories = e.stories.map((img) => StoryModel(img)).toList();

                            sampleUsers.add(new UserModel(e.name, e.avatar, stories));

                            navigate(context, StoryPreview(users: sampleUsers,pageIndex: 0 ,));

                          },
                        )).toList()))
                    :(snapshot.connectionState == ConnectionState.waiting)
                ? SliverFillRemaining(
                  child: CupertinoActivityIndicator(),

                ):
                    SliverFillRemaining(
                      child: Center(child: Text(snapshot.error.toString())),
                    )
              ],
            );
          }),
    );
  }
}

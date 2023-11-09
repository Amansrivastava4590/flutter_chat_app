import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_chat_app/model/message_model.dart';

import '../components/search_bar.dart';
import '../global.dart';

class MessageBoxScreen extends StatelessWidget {
  final contact;
  const MessageBoxScreen({Key? key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MessageModel>>(
        future: Whatsapp.Message(),
        builder: (context, snapshot) {
          return CupertinoPageScaffold(
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      CupertinoSliverNavigationBar(
                        largeTitle: Text(contact),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CupertinoButton(
                                onPressed: () {  },
                                child: Icon((CupertinoIcons.video_camera),color: Colors.green,)),
                            CupertinoButton(
                                onPressed: () {  },
                                child: Icon((CupertinoIcons.phone),color: Colors.blue,)),
                          ],
                        ),
                      ),
                      // SearchBar(
                      //   onChanged: (){},
                      //   onSubmitted: (){},
                      // ),

                      snapshot.hasData ?
                      SliverList(
                          delegate: SliverChildListDelegate(
                              snapshot.data!.map((e) {
                                return e.sender ?
                                    BubbleSpecialThree(
                                      text: e.msg,
                                      color: AppColors.primary!,
                                      tail: true,
                                      textStyle: TextStyle(color: CupertinoColors.white,fontSize: 16),)
                                    : BubbleSpecialThree(
                                  text: e.msg,
                                  color: CupertinoColors.systemGrey.color,
                                  tail: true,
                                  isSender: false,
                                  textStyle: TextStyle(color: CupertinoColors.black,fontSize: 16),);
                              }).toList()))
                          :(snapshot.connectionState == ConnectionState.waiting)
                          ? SliverFillRemaining(
                        child: CupertinoActivityIndicator(),

                      ):
                      SliverFillRemaining(
                        child: Center(child: Text(snapshot.error.toString())),
                      )
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CupertinoButton(
                        onPressed: () {  },
                        child: Icon((CupertinoIcons.add),color: Colors.blue,)),
                    CupertinoButton(
                        onPressed: () {  },
                        child: Icon((CupertinoIcons.camera),color: Colors.green,)),

                    Expanded(
                      child: CupertinoTextField(
                        placeholder: "Type something",
                        controller: TextEditingController(),

                      ),
                    ),

                    CupertinoButton(
                        onPressed: () {  },
                        child: Icon((Icons.send_sharp))),
                    SizedBox(height: 100,)
                  ],
                )
              ],
            ),
          );
        });
  }
}

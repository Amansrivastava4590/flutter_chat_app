import 'package:flutter/cupertino.dart';
import 'package:fluuter_chat_app/model/call_model.dart';

import '../components/list_tile_chat.dart';
import '../components/search_bar.dart';
import '../global.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<CallModel>>(
        future: Whatsapp.Call(),
        builder: (context, snapshot) {
          return CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text('Call'),
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
                        icon:e.outbound == "Missed"?CupertinoIcons.phone_badge_plus : e.outbound == "Incoming"?CupertinoIcons.phone_arrow_down_left:CupertinoIcons.phone_arrow_right,
                        onTap: () => {},
                        subtitle: e.outbound,
                        border: false,
                        title: e.name,
                        image: e.avatar,
                        onImageTap: () => {},
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
        });
  }
}

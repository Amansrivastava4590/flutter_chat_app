import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_chat_app/components/list_tile_chat.dart';
import 'package:fluuter_chat_app/model/me_model.dart';
import 'package:fluuter_chat_app/model/people_model.dart';

import '../components/search_bar.dart';
import '../global.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text('People'),
                trailing: CupertinoButton(
                  onPressed: (){},
                  child: Icon(CupertinoIcons.person_add),
                ),
              ),
              SearchBar(
                onChanged: () {},
                onSubmitted: () {},
              ),
              const MyStatus(),
              const PeopleList(),
            ],
          );
  }
}

class PeopleList extends StatelessWidget {

  const PeopleList({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PeopleModel>>(
        future: Whatsapp.People(),
        builder: (context, snapshot) {
         return snapshot.hasData
              ? SliverList(
              delegate: SliverChildListDelegate(snapshot.data!
                  .map((e) =>
                  ListTileChat(
                    image: e.avatar,
                    key: UniqueKey(),
                    title: "${e.firstName}  ${e.lastName}",
                    subtitle: e.msg,
                    border: false,
                    onTap: () => {},
                    onImageTap: () => {},
                  ))
                  .toList()))
              : (snapshot.connectionState == ConnectionState.waiting)
              ? SliverFillRemaining(
            child: CupertinoActivityIndicator(),
          )
              : SliverFillRemaining(
            child: Center(child: Text(snapshot.error.toString())),
          );
        });
  }}

class MyStatus extends StatelessWidget {
  const MyStatus({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<meModel>(
          future: Whatsapp.Me(),
          builder: (context, snapshot) {
            print("snapshot.data:${snapshot.data}");
            if(snapshot.hasData){
              meModel me = snapshot.data!;
              return  Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        GestureDetector(
                         // onTap: () => onImageTap(),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColors.primary,
                            child: CircleAvatar(
                              radius:  me.story? 35 :40,
                              backgroundImage: NetworkImage(me.avatar),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            me.firstName != null ?
                            Text(
                              me.firstName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ): Container(),
                            Text(
                              me.status,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 11, color: Colors.grey),
                            )

                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CupertinoButton(
                              onPressed: (){},
                              child: Icon(
                                CupertinoIcons.camera,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: 30,),
                            CupertinoButton(
                              onPressed: (){},
                              child: Icon(
                                CupertinoIcons.pencil,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        )



                      ],
                    ),
                  ),
                  Divider(thickness: 0.3,color: Colors.black,)
                ],
              );
            }
            else {return Container();}
          }),
    );
  }
}


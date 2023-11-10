import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_chat_app/Screens/messages.dart';
import 'package:fluuter_chat_app/Screens/story_preview.dart';
import 'package:fluuter_chat_app/components/list_tile_chat.dart';
import 'package:fluuter_chat_app/model/me_model.dart';
import 'package:fluuter_chat_app/model/people_model.dart';
import 'package:fluuter_chat_app/model/story_model.dart';
import 'package:fluuter_chat_app/model/user_model.dart';
import 'package:collection/collection.dart';
import '../components/search_bar.dart';
import '../global.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<PeopleModel>>(
      future: Whatsapp.People(),
        builder: (context, snapshot) => CustomScrollView(
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
                 Stories(snapshot: snapshot,),
                 PeopleList(snapshot: snapshot),
              ],
            ),
    );
  }
}

class PeopleList extends StatelessWidget {
final AsyncSnapshot<List<PeopleModel>> snapshot;
  const PeopleList({Key? key, required this.snapshot,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  snapshot.hasData
              ? SliverList(
              delegate: SliverChildListDelegate(snapshot.data!
                  .map((e) =>
                  ListTileChat(
                    image: e.avatar,
                    key: UniqueKey(),
                    title: "${e.firstName}  ${e.lastName}",
                    subtitle: e.msg,
                    border: false,
                    onTap: () => navigate(context,MessageBoxScreen(contact: "${e.firstName} ${e.lastName}",)),
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
                            child: Stack(
                              children: [CircleAvatar(
                                radius:  me.story? 35 :40,
                                backgroundImage: NetworkImage(me.avatar),
                              ),]
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

class Stories extends StatelessWidget {
  final AsyncSnapshot<List<PeopleModel>> snapshot;
  List<UserModel> sampleUsers=[];
   Stories({Key? key, required this.snapshot,}) {

     sampleUsers = snapshot.data?.where((people) => people.story!).map((people) {
       List<StoryModel> stories =  people.stories!.map((e) => StoryModel(e)).toList();

       return UserModel(people.firstName!,people.avatar!,stories);
     }).toList() ?? [];



  }

  @override
  Widget build(BuildContext context) {

    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
            child: Text("Recent Updates"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              height: 135, // Set the height of the container according to your needs
              child: snapshot.hasData
                  ? ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data!.where((PeopleModel people) => (people.story!)).mapIndexed((int index,PeopleModel e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                           onTap: () =>navigate(context, StoryPreview(users: sampleUsers,pageIndex: index,)),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColors.primary,
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(e.avatar!),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          e.firstName!,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          e.lastName!,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )
                  : (snapshot.connectionState == ConnectionState.waiting)
                  ? Center(child: CupertinoActivityIndicator())
                  : Center(child: Text(snapshot.error.toString())),
            ),
          ),
          Divider(thickness: 0.3,color: Colors.black,)
        ],
      ),
    );

  }
}



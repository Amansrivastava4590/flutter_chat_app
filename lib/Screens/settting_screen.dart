import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_chat_app/global.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text('Setting'),
        ),
        SettingItem(),
        SettingItem(),
        SettingItem(),
        SettingItem(),
      ],
    );
  }
}

class SettingItem extends StatelessWidget {
  const SettingItem({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        SliverToBoxAdapter(
          child: Column(
            children: [
              CupertinoListTile(
                onTap: (){},
                  leading: Stack(
                    children: [
                      Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                      Positioned(
                          top: 3.5,
                          left: 1,
                          right: 1,
                          child: Icon(CupertinoIcons.star_fill,size: 20,color: Colors.white)),],
                  ),
                  trailing: Icon(CupertinoIcons.chevron_right),
                  title: Text('Starred Messaged',style: TextStyle(fontSize: 15,color: AppColors.primary),)),
              Container(
                margin: const EdgeInsets.only(left: 65.0),
                child: Divider(color: Colors.black,thickness: 0.2),
              ),
            ],
          ),

        );

  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_chat_app/global.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text('Setting'),
        ),
        SettingItem(
            title: "Starred Messaged",
            color: Colors.yellow,
            icon: CupertinoIcons.star_fill,
            onTap: () {}),
        SettingItem(
            title: "Linked Device",
            color: Colors.lightBlueAccent,
            icon: CupertinoIcons.device_laptop,
            onTap: () {}),
        SettingItem(
            title: "Account",
            color: Colors.blue,
            icon: CupertinoIcons.person_fill,
            onTap: () {}),
        SettingItem(
            title: "Chats",
            color: Colors.green,
            icon: CupertinoIcons.chat_bubble_fill,
            onTap: () {}),
        SettingItem(
            title: "Notification",
            color: Colors.red,
            icon: CupertinoIcons.app_badge,
            onTap: () {}),
        SettingItem(
            title: "Storage and Data",
            color: Colors.lightGreenAccent,
            icon: CupertinoIcons.star_fill,
            onTap: () {}),
        SettingItem(
            title: "Help",
            color: Colors.blue,
            icon: CupertinoIcons.info_circle_fill,
            onTap: () {}),
        SettingItem(
            title: "Tell a Friend",
            color: Colors.pink,
            icon: CupertinoIcons.heart_fill,
            onTap: () {}),
      ],
    );
  }
}

class SettingItem extends StatelessWidget {
  final title;
  final icon;
  final color;
  final onTap;
  const SettingItem({Key? key, this.title, this.icon, this.color, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          CupertinoListTile(
              onTap: () {},
              leading: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  Positioned(
                      top: 3.5,
                      left: 1,
                      right: 1,
                      child: Icon(icon, size: 20, color: Colors.white)),
                ],
              ),
              trailing: Icon(CupertinoIcons.chevron_right),
              title: Text(
                title,
                style: TextStyle(fontSize: 15, color: AppColors.primary),
              )),
          Container(
            margin: const EdgeInsets.only(left: 65.0),
            child: Divider(color: Colors.black, thickness: 0.2),
          ),
        ],
      ),
    );
  }
}

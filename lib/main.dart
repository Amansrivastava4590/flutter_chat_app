import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_chat_app/Screens/call_screen.dart';
import 'package:fluuter_chat_app/Screens/chats_screen.dart';
import 'package:fluuter_chat_app/Screens/people_screen.dart';
import 'package:fluuter_chat_app/Screens/settting_screen.dart';
import 'package:fluuter_chat_app/global.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary
      ),

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    meMethod();
    // TODO: implement initState
    super.initState();
  }
  logPrint(String s){
    var logger = Logger();
    logger.d(s);
  }

  void meMethod() async{
    var me = await Whatsapp.Me();
    logPrint("log instead of print:$me");
  }

  var screens = [ChatPage(), CallScreen(),PeopleScreen(),SettingPage()];


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          tabBuilder: (BuildContext context,int i ){
            return Center(
                child: Container(
                  child: screens[3]));
          },
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          label: "Chats",
            icon: Icon(CupertinoIcons.chat_bubble)),
        BottomNavigationBarItem(
            label: "Calls",
            icon: Icon(CupertinoIcons.phone)),
        BottomNavigationBarItem(
            label: "People",
            icon: Icon(CupertinoIcons.person_alt_circle)),
        BottomNavigationBarItem(
            label: "Setting",
            icon: Icon(CupertinoIcons.settings_solid))
      ],),
    ));
  }
}

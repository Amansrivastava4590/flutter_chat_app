import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_chat_app/Screens/call_screen.dart';
import 'package:fluuter_chat_app/Screens/chats_screen.dart';
import 'package:fluuter_chat_app/Screens/login_screen.dart';
import 'package:fluuter_chat_app/Screens/people_screen.dart';
import 'package:fluuter_chat_app/Screens/settting_screen.dart';
import 'package:fluuter_chat_app/global.dart';
import 'package:logger/logger.dart';

import 'Screens/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  with WidgetsBindingObserver{
  Brightness? _brightness;

 @override
  void initState() {
   WidgetsBinding.instance.addObserver(this);
   _brightness = WidgetsBinding.instance.window.platformBrightness;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
   if(mounted) {
     setState(() {
       _brightness = WidgetsBinding.instance.window.platformBrightness;
     });

   }
    super.didChangePlatformBrightness();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: _brightness == Brightness.light ? Brightness.light:Brightness.dark,
        primaryColor: AppColors.primary
      ),

      home:  RegisterPage(),
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
                  child: screens[i]));
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

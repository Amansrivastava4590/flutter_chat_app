import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  late String userId;
  bool _isSignedIn = false;
  final _storage = const FlutterSecureStorage();

 @override
  void initState() {
   WidgetsBinding.instance.addObserver(this);
   _brightness = WidgetsBinding.instance.window.platformBrightness;
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() async{
   _storage.write(key: 'userId', value: "657df64fbe1dfc2521aec38a");
    userId = (await _storage.read(key: "userId"))!;

    if(userId.isNotEmpty){
    _isSignedIn = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
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

      home: _isSignedIn ? MyHomePage(userId: userId) : RegisterPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String userId;
  MyHomePage({Key? key,required this.userId}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _storage = const FlutterSecureStorage();

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
    var me = await Whatsapp.Me(widget.userId);
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


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluuter_chat_app/main.dart';
import 'package:fluuter_chat_app/model/call_model.dart';
import 'package:fluuter_chat_app/model/chat_model.dart';
import 'package:fluuter_chat_app/model/people_model.dart';
import 'package:http/http.dart' as http;
import 'model/me_model.dart';
import 'model/message_model.dart';

const url = "http://localhost:3000";

class AppColors {
  static Color? primary = const Color(0xFFC10000);
}

class Whatsapp {
  static const whatsappUrl = "$url/whatsapp";

  static Future<meModel> Me(String userId)async{
    final res = await http.get(Uri.parse("$whatsappUrl-users/me/$userId"));
    if(res.statusCode == 200){
      print("parsed Me:${json.decode(res.body)}");
      return meModel.fromJson(json.decode(res.body));
    }
    throw Exception(res.reasonPhrase);

  }
  static Future Register(BuildContext context,String username,String email,String status)async{
    Map body = {
      "username":username,
      "email":email,
      "status":status,
      "story":false,
      "avatar": null
    };
    http.Response res  = await http.post(
        Uri.parse("$whatsappUrl-users/me"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode(body));
    print(res.statusCode);
    if(res.statusCode == 201){
      final parsed = jsonDecode(res.body);
      print("parsed122:${parsed['data']['_id']}");
      final _storage = const FlutterSecureStorage();
      _storage.write(key: "userId", value: parsed['data']['_id']);
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => MyHomePage(userId: parsed['data']['_id'],),
        ),
      );
     print("Successfull");
    }
    throw Exception(res.reasonPhrase);

  }
  static Future<List<ChatModel>> Chats()async{
    final res = await http.get(Uri.parse("$whatsappUrl-chats/chats"));
    //Response response = await get(Uri.parse("$whatsappUrl/chats"));
    if(res.statusCode == 200){
      final parsed = jsonDecode(res.body);
      return parsed.map<ChatModel>((json) => ChatModel.fromJson(json)).toList();
    }
    throw Exception(res.reasonPhrase);

  }
  static Future<List<CallModel>> Call()async{
    final res = await http.get(Uri.parse("$whatsappUrl-calls/calls"));
    //Response response = await get(Uri.parse("$whatsappUrl/chats"));
    if(res.statusCode == 200){
      final parsed = jsonDecode(res.body);
      print("parsed call:${json.decode(res.body)}");
      return parsed.map<CallModel>((json) => CallModel.fromJson(json)).toList();
    }
    throw Exception(res.reasonPhrase);

  }
  static Future<List<PeopleModel>> People()async{
    try {
      final res = await http.get(Uri.parse("$whatsappUrl-people/people"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          }
      );
      if (res.statusCode == 200) {
        final parsed = jsonDecode(res.body);
        print("parsed people:${json.decode(res.body)}");
        return parsed.map<PeopleModel>((json) => PeopleModel.fromJson(json))
            .toList();
      }
      else {
        throw Exception("failed");
      }
    }
    catch (err){
      throw Exception(err);
    }

  }

  static Future<List<MessageModel>> Message()async{
    try {
      final res = await http.get(Uri.parse("$whatsappUrl-messages/message"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          }
      );
      if (res.statusCode == 200) {
        final parsed = jsonDecode(res.body);
        print("parsed message:${json.decode(res.body)}");
        return parsed.map<MessageModel>((json) => MessageModel.fromJson(json))
            .toList();
      }
      else {
        throw Exception(res.reasonPhrase);
      }
    }
    catch (err){
      throw Exception(err);
    }

  }
}

void navigate(BuildContext context,Widget a){
  Navigator.push(context, CupertinoPageRoute(builder: (context)=> a));
}

void pop(context) => Navigator.pop(context);
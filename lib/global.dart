
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluuter_chat_app/model/call_model.dart';
import 'package:fluuter_chat_app/model/chat_model.dart';
import 'package:fluuter_chat_app/model/people_model.dart';
import 'package:http/http.dart' as http;
import 'model/me_model.dart';
import 'model/message_model.dart';

const url = "http://192.168.1.96:3000";

class AppColors {
  static Color? primary = const Color(0xFFC10000);
}

class Whatsapp {
  static const whatsappUrl = "$url/whatsapp";

  static Future<meModel> Me()async{
    final res = await http.get(Uri.parse("$whatsappUrl-users/me"));
    if(res.statusCode == 200){
      print(res.body);
      return meModel.fromJson(json.decode(res.body));
    }
    throw Exception(res.reasonPhrase);

  }
  static Future<List<ChatModel>> Chats()async{
    final res = await http.get(Uri.parse("$whatsappUrl-chats/chats"));
    //Response response = await get(Uri.parse("$whatsappUrl/chats"));
    if(res.statusCode == 200){
      final parsed = jsonDecode(res.body);
      print(parsed);
      return parsed.map<ChatModel>((json) => ChatModel.fromJson(json)).toList();
    }
    throw Exception(res.reasonPhrase);

  }
  static Future<List<CallModel>> Call()async{
    final res = await http.get(Uri.parse("$whatsappUrl-calls/calls"));
    //Response response = await get(Uri.parse("$whatsappUrl/chats"));
    if(res.statusCode == 200){
      final parsed = jsonDecode(res.body);
      return parsed.map<CallModel>((json) => CallModel.fromJson(json)).toList();
    }
    throw Exception(res.reasonPhrase);

  }
  static Future<List<PeopleModel>> People()async{
    try {
      final res = await http.get(Uri.parse("$whatsappUrl-messages/people"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          }
      );
      if (res.statusCode == 200) {
        final parsed = jsonDecode(res.body);
        print(parsed);
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
      final res = await http.get(Uri.parse("$whatsappUrl/message"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          }
      );
      if (res.statusCode == 200) {
        final parsed = jsonDecode(res.body);
        print(parsed);
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Register'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              padding: EdgeInsets.all(16.0),
              onPressed: () {
                // Handle profile picture selection
                print('Select Profile Picture');
              },
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage("https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/965.jpg"),
              ),
            ),
            SizedBox(height: 16.0),
            CupertinoTextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              placeholder: 'Phone Number',
              prefix: Icon(CupertinoIcons.phone),
            ),
            SizedBox(height: 16.0),
            CupertinoTextField(
              controller: userNameController,
              placeholder: 'Username',
              prefix: Icon(CupertinoIcons.person),
            ),
            SizedBox(height: 16.0),
            CupertinoTextField(
              controller: statusController,
              placeholder: 'Status',
              prefix: Icon(CupertinoIcons.info),
            ),
            SizedBox(height: 32.0),
            CupertinoButton.filled(
              onPressed: () {
                // Handle registration logic
                print('Phone Number: ${phoneNumberController.text}');
                print('Username: ${userNameController.text}');
                print('Status: ${statusController.text}');

                Whatsapp.Register(context,userNameController.text,phoneNumberController.text,statusController.text);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
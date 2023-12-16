import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_chat_app/Screens/register_page.dart';
import 'package:fluuter_chat_app/global.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordHidden = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordControoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor:
            Theme.of(context).primaryColor.withOpacity(0.4).withRed(5),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Image.network(
                    "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/965.jpg"),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Email or Phone",style: TextStyle( color: AppColors.primary),),
              SizedBox(
                height: 5,
              ),
              CupertinoTextField(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                controller: emailController,
                placeholder: "Email or Phone",
                placeholderStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
                padding: EdgeInsets.all(15),
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Password",style: TextStyle( color: AppColors.primary),),
              SizedBox(
                height: 5,
              ),
              CupertinoTextField(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                controller: passwordControoller,
                placeholder: "Password",
                padding: EdgeInsets.all(15),
                obscureText: isPasswordHidden == true ? true : false,
                onEditingComplete: () {},
                suffix: CupertinoButton(
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                    child: Icon(
                      isPasswordHidden
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      size: 20.0,
                    )),
                placeholderStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(child: CupertinoButton(
                color: AppColors.primary,
                  child: Text("Sign In",style: TextStyle(color: Colors.black),), onPressed: () {})),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: TextStyle(color: Colors.black),),
                  CupertinoButton(padding: EdgeInsets.zero,
                    child: Text(" Register here",style: TextStyle(
                      decoration: TextDecoration.underline,
                        color: Colors.blueAccent),),onPressed: (){
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },),
                ],
              ),

            ],
          ),
        ));
  }
}

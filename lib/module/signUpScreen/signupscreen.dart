

import 'package:album_app/shared/style/fonts.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up', style: TextStyle(

      fontFamily: fontFamily,
      fontWeight: FontWeightManager.light,
          fontSize: FontSizeManager.s16
      ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },),
      ),

      body: Column(
        children: [
        ],
      ),
    );
  }
}

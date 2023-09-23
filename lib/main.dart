import 'package:actual2/common/component/custom_text_form_field.dart';
import 'package:actual2/user/view/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: LoginScreen()
      ),
    );
  }
}


import 'dart:convert';

import 'package:actual2/common/const/colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../common/component/custom_text_form_field.dart';
import '../../common/layout/default_layout.dart';
import '../../common/view/root_tab.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String emailValue = '';
  String passwordValue = '';

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    final ip = '';

    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SafeArea(
            top: true,
            bottom: false,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _Title(),
                  const SizedBox(height: 16.0),
                  const _SubTitle(),
                  Image.asset('asset/img/misc/logo.png',
                      width: MediaQuery.of(context).size.width / 3 * 2),
                  CustomTextFormField(
                    hintText: '이메일을 입력해주세요',
                    onChanged: (String value) {
                      emailValue = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextFormField(
                    hintText: '비밀번호를 입력해주세요',
                    obscureText: true,
                    onChanged: (String value) {
                      passwordValue = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                      onPressed: () async {
                        final rawString = '$emailValue:$passwordValue';

                        // String 값을 넣고 String으로 반환함
                        Codec<String, String> stringToBase64 = utf8.fuse(base64);
                        String token = stringToBase64.encode(rawString);

                        final response = await dio.post("http://$ip/api/auth/login",
                          options: Options(
                            headers: {
                              'Authorization': 'Basic $token',
                            },
                          ));

                        var data = response.data;

                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const RootTab())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                      ),
                      child: const Text('로그인')),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      child: const Text('회원가입'))
                ]),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('환영합니다!',
        style: TextStyle(
            fontSize: 34.0, fontWeight: FontWeight.w500, color: Colors.black));
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길 :)',
        style: TextStyle(fontSize: 16.0, color: bodyTextColor));
  }
}

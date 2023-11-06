import 'package:actual2/common/const/colors.dart';
import 'package:actual2/common/const/data.dart';
import 'package:actual2/common/layout/default_layout.dart';
import 'package:actual2/common/view/root_tab.dart';
import 'package:actual2/user/view/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();

    checkToken();
  }

  void deleteToken() async{
    await storage.deleteAll();
  }

  void checkToken() async {
    final refreshToken = await storage.read(key: refreshTokenKey);
    final accessToken = await storage.read(key: accessTokenKey);

    if (!context.mounted) return;
    if(refreshToken == null || accessToken == null){
      deleteToken();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false
      );
    }else{
      final response = await dio.postUri(Uri.parse(loginUrl),
          options: Options(
            headers: {
              'Authorization': 'Basic $token'
            },
          ));

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const RootTab()),
              (route) => false
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        backgroundColor: primaryColor,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset('asset/img/logo/logo.png',width: MediaQuery.of(context).size.width / 2),
              const SizedBox(height: 16.0),
              const CircularProgressIndicator(color: Colors.white,)
            ],
          ),
        )
    );
  }
}
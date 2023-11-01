import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget{
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  
  const DefaultLayout({Key? key, required this.child, this.backgroundColor,
    this.title, this.bottomNavigationBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor ?? Colors.white,
        appBar: renderBar(),
        body: child,
        bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? renderBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
            child: Text(
          title!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )),
        foregroundColor: Colors.black,
      );
    }
  }
}
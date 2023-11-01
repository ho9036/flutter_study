import 'package:actual2/common/const/colors.dart';
import 'package:flutter/material.dart';

import '../layout/default_layout.dart';

class RootTab extends StatefulWidget{
  const RootTab({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    // vsync 렌더링 위젯
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '율란 딜리버리',
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryColor,
          unselectedItemColor: bodyTextColor,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.shifting,
          onTap: (index) {
            controller.animateTo(index);
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: '홈'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood_outlined),
                label: '음식'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined),
                label: '주문'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: '프로필'
            ),
          ],
        ),
        child: TabBarView(
          // 탭을 스크롤링으로 옆페이지로 못 넘김
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            Center(child: Container(child: Text('홈'))),
            Center(child: Container(child: Text('음식'))),
            Center(child: Container(child: Text('주문'))),
            Center(child: Container(child: Text('프로필'))),
          ],
        ),
    );
  }
}
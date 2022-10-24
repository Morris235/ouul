import 'package:flutter/material.dart';
import 'package:ouul/views/vote_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '모두의 놀이터 - 아울',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'OUUL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[VoteListPage()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        currentIndex: _pageIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Now',
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home_outlined),
              tooltip: '메인 페이지로 이동',
            ),
          ),
          BottomNavigationBarItem(
            label: '투표',
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.how_to_vote_outlined),
              tooltip: '좋아요 페이지로 이동',
            ),
          ),
          BottomNavigationBarItem(
            label: '피드',
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star_outline),
              tooltip: '사용자 페이지로 이동',
            ),
          ),
          BottomNavigationBarItem(
            label: '마이페이지',
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_2_outlined),
              tooltip: '사용자 페이지로 이동',
            ),
          )
        ],
      ),
    );
  }
}

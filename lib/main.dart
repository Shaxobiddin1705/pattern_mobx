import 'package:flutter/material.dart';
import 'package:pattern_mobx/pages/add_post_page.dart';
import 'package:pattern_mobx/pages/home_page.dart';
import 'package:pattern_mobx/pages/update_post_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        AddPostPage.id: (context) => const AddPostPage(),
        UpdatePostPage.id: (context) => UpdatePostPage(),
      },
    );
  }
}
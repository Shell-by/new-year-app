import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> chidren = [];

  @override
  Widget build(BuildContext context) {
    // http.post(
    //   Uri.parse(''),
    //   headers: {
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: {},
    // );
    const list = ['1월 1일'];

    return Column(
      children: chidren,
    );
  }
}

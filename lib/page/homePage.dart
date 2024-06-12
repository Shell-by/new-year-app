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
    const list = ['1월 1일', '10월 26일', '12월 31일'];
    for (int i = 0; i < list.length; i++) {
      chidren.add(
        InkWell(
          onTap: () => {
            print(i)
          },
          child: Ink(
            child: SizedBox(
              width: double.infinity,
              height: 60.0,
              child: Text(list.elementAt(i)),
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: chidren,
      ),
    );
  }
}

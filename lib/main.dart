import 'package:flutter/material.dart';
import 'package:joke/ui/master_detail_screen.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MasterDetailScreen(),
    );
  }
}


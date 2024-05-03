import 'package:flutter/material.dart';
import 'pages/candidat_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candidats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CandidateListPage(),
    );
  }
}

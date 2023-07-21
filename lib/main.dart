import 'package:flutter/material.dart';

import 'Screens/detailed_screen.dart';
import 'Screens/openning_screen.dart';
import 'Shared/cardimage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: //detailed_screen(),
          // Card_image(index: 0),
          openning_screen(),
    );
  }
}

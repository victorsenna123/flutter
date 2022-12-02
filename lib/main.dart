import 'package:flutter/material.dart';
import 'package:layout_inicial/pages/home_page.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: HomePage(),
    );
  }
}
  // o scaffold é o esqueleto da nossa página,a parti dele podemos determinar appbar,navigatorbar,body..
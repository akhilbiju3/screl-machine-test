import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/controller/homescreen_controller/homescreen_controller.dart';
import 'package:test1/view/screens/homescreen/home.dart';

void main() {
  runApp(const ScrelTest());
}

class ScrelTest extends StatefulWidget {
  const ScrelTest({super.key});

  @override
  State<ScrelTest> createState() => _ScrelTestState();
}

class _ScrelTestState extends State<ScrelTest> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>HomescreenController() ,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

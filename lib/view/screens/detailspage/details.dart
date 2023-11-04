import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String userName;
  final String pH;
  final int selectedIndex;
  const DetailsPage({super.key, required this.userName, required this.pH, required this.selectedIndex});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Details",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(widget.userName[widget.selectedIndex]), Text(widget.pH[widget.selectedIndex])],
      )),
    );
  }
}

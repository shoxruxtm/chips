import 'package:flutter/material.dart';

import 'widget/bottom_navigator.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageNumber = 0;
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void pageChanger(int value) {
    controller.animateToPage(
      value,
      duration: const Duration(milliseconds: 1500),
      curve: Curves.elasticInOut,
    );
    setState(() {
      pageNumber = value;
    });
  }

  @override
  Widget build(BuildContext context) => Theme(
    data: ThemeData(
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    child: Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        scrollDirection: Axis.vertical,
        children: const [
          Scaffold(
            backgroundColor: Color(0xFF4FC0D0),
            body: Center(
              child: Text("Page 1"),
            ),
          ),
          Scaffold(
            backgroundColor: Color(0xFFCBFFA9),
            body: Center(
              child: Text("Page 2"),
            ),
          ),
          Scaffold(
            backgroundColor: Color(0xFFC3EDC0),
            body: Center(
              child: Text("Page 3"),
            ),
          ),
          Scaffold(
            backgroundColor: Color(0xFFA2FF86),
            body: Center(
              child: Text("Page 4"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        pageNumber: pageNumber,
        onPageChange: pageChanger,
      ),
    ),
  );
}
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    required this.pageNumber,
    required this.onPageChange,
    super.key,
  });

  final int pageNumber;
  final void Function(int value) onPageChange;

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
    backgroundColor: const Color(0xFFDAFFFB),
    fixedColor: const Color(0xFF116D6E),
    unselectedItemColor: const Color(0xFF73BBC9),
    showUnselectedLabels: false,
    elevation: 0,
    landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
    type: BottomNavigationBarType.fixed,
    currentIndex: pageNumber,
    onTap: onPageChange,
    showSelectedLabels: true,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.library_books),
        label: "News",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.language),
        label: "Global",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: "For you",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shelves),
        label: "Trending",
      ),
    ],
  );
}

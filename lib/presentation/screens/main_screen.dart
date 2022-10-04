import 'package:flutter/material.dart';

import './profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 4;
  late PageController _pageController;

  void _onPageChanged(int pageIndex) {
    setState(() {
      _pageIndex = pageIndex;
    });
    _pageController.jumpToPage(pageIndex);
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: _pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(),
          Container(),
          Container(),
          Container(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: _onPageChanged,
        items: [
          BottomNavigationBarItem(
            icon: _pageIndex == 0
                ? const Icon(Icons.home)
                : const Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _pageIndex == 1
                ? const Icon(Icons.search)
                : const Icon(Icons.search_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _pageIndex == 2
                ? const Icon(Icons.add_box)
                : const Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _pageIndex == 3
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _pageIndex == 4
                ? const Icon(Icons.circle)
                : const Icon(Icons.circle_outlined),
            label: '',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

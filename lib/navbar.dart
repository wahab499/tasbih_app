import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tasbih_app/namaz.dart';
import 'package:tasbih_app/Quran.dart';
import 'package:tasbih_app/profile.dart';
import 'package:tasbih_app/reward.dart';
import 'package:tasbih_app/tasbihhome.dart';

class BottomNavBar extends StatefulWidget {
  final int index;
  BottomNavBar({super.key, required this.index});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.index; // Start with passed index
    super.initState();
  }

  final List<Widget> _pages = [
    Tasbeeh(), // index 0
    Quran(), // index 1
    Namaz(), // index 2
    Reward(), // index 3
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Use IndexedStack to keep screen states
          //IndexedStack(index: _selectedIndex, children: _pages),
          _pages[_selectedIndex],
        ],
      ),

      // Custom Bottom Navigation Bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 10,
          right: 10,
          top: 10,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(0, 'assets/icons/tasbih.png', 'Zikar'),
                  _buildNavItem(1, 'assets/icons/quran.png', 'Quran'),
                  _buildNavItem(2, 'assets/icons/namaz.png', 'Namaz'),
                  _buildNavItem(3, 'assets/icons/reward.png', 'Reward'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Build Navigation Item
  Widget _buildNavItem(int index, String assetPath, String label) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            child: Image.asset(
              assetPath,
              height: 34,
              width: 34,
              color: isSelected ? Colors.black54 : Colors.black87,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black54 : Colors.black87,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

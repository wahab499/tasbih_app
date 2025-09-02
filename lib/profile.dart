import 'package:flutter/material.dart';
import 'package:tasbih_app/navbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavBar(index: 0),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withValues(alpha: 0.2),
                    child: Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(width: 100, height: 100, color: Colors.amberAccent),
          ],
        ),
      ),
    );
  }
}

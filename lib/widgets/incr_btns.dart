import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncrBtns extends StatefulWidget {
  final Function(int) onSave;
  const IncrBtns({super.key, required this.onSave});

  @override
  State<IncrBtns> createState() => _IncrBtnsState();
}

class _IncrBtnsState extends State<IncrBtns> {
  int _count = 0;
  int totalcount = 0;
  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  void _save() {
    if (_count != 0) {
      Get.snackbar(
        'Saved',
        'Tasbeeh is Saved Sucessfully',
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.snackbar(
        'Tasbeeh is 0',
        'Nothing for Saving',
        snackPosition: SnackPosition.TOP,
      );
    }

    widget.onSave(_count); // Send value to parent screen
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Text(
          _count.toString().padLeft(5, '0'),
          style: TextStyle(
            fontSize: 70,
            fontFamily: 'digital-7',
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _increment,
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellow.withValues(alpha: 0.5),
                      blurRadius: 25,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(Icons.touch_app, color: Colors.black, size: 50),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 26),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: _reset,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Icon(Icons.refresh, color: Colors.black, size: 35),
                ),
              ),
              InkWell(
                onTap: _save,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Icon(Icons.save, color: Colors.black, size: 35),
                ),
              ),
              InkWell(
                onTap: _decrement,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Icon(Icons.remove, color: Colors.black, size: 35),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

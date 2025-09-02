import 'package:flutter/material.dart';

class IncrBtns extends StatefulWidget {
  const IncrBtns({super.key});

  @override
  State<IncrBtns> createState() => _IncrBtnsState();
}

class _IncrBtnsState extends State<IncrBtns> {
  int _count = 0;
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
    setState(() {});
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
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 30),
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
        SizedBox(height: 10),
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

// class RippleButton extends StatefulWidget {
//   @override
//   _RippleButtonState createState() => _RippleButtonState();
// }

// class _RippleButtonState extends State<RippleButton> {
//   double rippleSize = 0;
//   double rippleOpacity = 0;

//   void _onTap() {
//     setState(() {
//       rippleSize = 300; // Expand ripple
//       rippleOpacity = 0.3; // Visible
//     });

//     // After short delay, fade out and reset
//     Future.delayed(Duration(milliseconds: 300), () {
//       setState(() {
//         rippleOpacity = 0;
//       });
//     });

//     Future.delayed(Duration(milliseconds: 600), () {
//       setState(() {
//         rippleSize = 0; // Reset size
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _onTap,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // Ripple Effect
//           AnimatedContainer(
//             duration: Duration(milliseconds: 500),
//             height: rippleSize,
//             width: rippleSize,
//             decoration: BoxDecoration(
//               color: Colors.yellow.withOpacity(rippleOpacity),
//               shape: BoxShape.circle,
//             ),
//           ),

//           // Main Button
//           Container(
//             height: 180,
//             width: 180,
//             decoration: BoxDecoration(
//               color: Colors.amber,
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.yellow.withValues(alpha: 0.5),
//                   blurRadius: 25,
//                   spreadRadius: 5,
//                 ),
//               ],
//             ),
//             child: Center(
//               child: Icon(Icons.touch_app, color: Colors.black, size: 50),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tasbih_app/navbar.dart';
import 'package:tasbih_app/widgets/incr_btns.dart';

class Tasbeeh extends StatefulWidget {
  const Tasbeeh({super.key});

  @override
  State<Tasbeeh> createState() => _TasbeehState();
}

class _TasbeehState extends State<Tasbeeh> {
  List selectedzikr = [
    {
      'Arabic': 'ٱلْحَمْدُ لِلَّٰهِ',
      'English': 'Alhamdulillah',
      'Translation': 'All praise is due to Allah',
    },
  ];

  List<Map<String, String>> zikrList = [
    {
      'Arabic': 'ٱلْحَمْدُ لِلَّٰهِ',
      'English': 'Alhamdulillah',
      'Translation': 'All praise is due to Allah.',
    },
    {
      'Arabic': 'سُبْحَانَ ٱللَّٰهِ',
      'English': 'SubhanAllah',
      'Translation': 'Allah is free from imperfection',
    },
    {
      'Arabic': 'أَسْتَغْفِرُ ٱللَّٰهَ',
      'English': 'Astagfriullah',
      'Translation': 'I seek forgiveness from Allah',
    },
    {
      'Arabic': 'لَا إِلٰهَ إِلَّا ٱللَّٰهُ',
      'English': 'La ilaha ill lal lah',
      'Translation': 'There is no god except Allah',
    },
    {
      'Arabic': 'بِسْمِ ٱللَّٰهِ',
      'English': 'Bismillah',
      'Translation': 'In the name of Allah',
    },
    {
      'Arabic': 'ٱللَّٰهُ أَكْبَرُ',
      'English': 'Allah ho Akbar',
      'Translation': 'Allah is the Greatest',
    },
    {
      'Arabic': 'رَبِّ زِدْنِي عِلْمًا',
      'English': 'Rabi Zidni Ilmaa',
      'Translation': 'My Lord, increase me in knowledge',
    },
  ];
  late List<bool> favoriteStatus = List.filled(zikrList.length, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF9F0), Color(0xFFFFF1D6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'السلام عليكم',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBar(index: 4),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.black.withValues(alpha: 0.2),
                        child: Icon(
                          Icons.person,
                          size: 28,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      // transitionAnimationController: AnimationController(
                      //   duration: const Duration(milliseconds: 500),
                      //   vsync: Navigator.of(context),
                      // ),
                      builder: (context) {
                        return Container(
                          height: 600,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFE8F5E9),
                                Color(0xFFF1F8E9),
                                Color(0xFFFFFFFF),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ListView.builder(
                              itemCount: zikrList.length,
                              itemBuilder: (context, index) {
                                return AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  height: 120,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.amber.shade200,
                                        Colors.amber.shade400,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 6,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          zikrList[index]['Arabic']!,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            selectedzikr[0] = zikrList[index];
                                            setState(() {
                                              selectedzikr;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        top: 50,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              favoriteStatus[index] =
                                                  !favoriteStatus[index];
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              favoriteStatus[index]
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,

                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Select a Zikr',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  selectedzikr[0]['Arabic']!,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Amiri',
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  selectedzikr[0]['English']!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  selectedzikr[0]['Translation']!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38,
                  ),
                ),

                IncrBtns(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

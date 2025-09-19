import 'package:flutter/material.dart';
import 'package:tasbih_app/navbar.dart';

class Profile extends StatelessWidget {
  final List<dynamic>? selectedzikr;
  final int? totalCount;
  const Profile({super.key, this.selectedzikr, this.totalCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
        child:
            selectedzikr == null
                ? Text('list is empty')
                : Column(
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
                            backgroundColor: Colors.black.withValues(
                              alpha: 0.2,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              size: 28,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: selectedzikr!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 8,
                            ), // add spacing
                            width: 380,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    totalCount.toString().padLeft(5, '0'),
                                    style: TextStyle(
                                      fontFamily: 'digital-7',
                                      fontSize: 40,
                                      color: Colors.black,
                                      letterSpacing: 4,
                                    ),
                                  ),
                                  Text(
                                    selectedzikr?[0]['Arabic']!,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text('Date : 2/08/2025'),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movieapp/color.dart';
import 'package:movieapp/homepage.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({Key? key}) : super(key: key);

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

int active = 1;

class _BottomnavigationState extends State<Bottomnavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Appcolor.appcolor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon(Icons.home_rounded, 1),
          icon(Icons.movie, 2),
          icon(Icons.play_circle, 3),
          icon(Icons.person_rounded, 4),
        ],
      ),
    );
  }

  Widget icon(
    final IconData icon,
    final int index,
  ) {
    if (active == index) {
      return IconButton(
          onPressed: () {
            if (index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Homepage())));
            }
            setState(() {
              active = index;
            });
          },
          icon: Icon(
            icon,
            color: Colors.white,
          ));
    } else {
      return IconButton(
          onPressed: () {
            if (index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Homepage())));
            }
            setState(() {
              active = index;
            });
          },
          icon: Icon(
            icon,
            color: Colors.grey,
          ));
    }
  }
}

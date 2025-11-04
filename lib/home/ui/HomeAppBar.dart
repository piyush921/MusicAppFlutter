import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/logo1.png', height: 60, width: 60),
                const Text(
                  "EchoPlay",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.notifications_outlined, color: Colors.white),
                SizedBox(width: 10),
                Icon(Icons.person_2_rounded, color: Colors.white)
              ],
            ),
          ],
        ),
      ),
    );
  }

}
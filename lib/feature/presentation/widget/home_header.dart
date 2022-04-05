import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 65,
          width: 65,
          child: Image.asset(
            'assets/user.png',
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Welcome'),
            Text(
              'Kim Na Young',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Expanded(
          child: SizedBox(
            height: 28,
            width: 28,
            child: Image.asset(
              'assets/user.png',
            ),
          ),
        )
      ],
    );
  }
}

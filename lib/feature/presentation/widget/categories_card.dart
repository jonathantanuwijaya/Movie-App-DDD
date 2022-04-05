import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  final String text;
  final Color? color;
  const CategoriesCard({Key? key, required this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: color ?? Colors.blueGrey[800],
          height: 25,
          width: 90,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}

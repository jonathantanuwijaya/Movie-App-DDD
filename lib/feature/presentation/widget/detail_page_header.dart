import 'package:flutter/material.dart';
import 'package:movieapp/feature/presentation/home/home_page.dart';

class DetailPageHeader extends StatelessWidget {
  const DetailPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage()));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
                height: 40,
                width: 40,
                color: Colors.blueGrey[800],
                child: const Center(
                    child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 17,
                ))),
          ),
        ),
        const Text(
          'Detail',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
              height: 40,
              width: 40,
              color: Colors.blueGrey[800],
              child: const Center(
                  child: Icon(
                Icons.share,
                color: Colors.white,
                size: 17,
              ))),
        ),
      ],
    );
  }
}

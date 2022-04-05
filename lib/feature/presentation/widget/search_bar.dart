import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 50,
        width: double.infinity,
        color: Colors.blueGrey[800],
        child: TextFormField(
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(4),
              fillColor: Colors.white,
              hintText: 'search movie',
              border: InputBorder.none),
        ),
      ),
    );
  }
}

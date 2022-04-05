import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(1),
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey[800],
        child: Row(
          children: [
            const Icon(Icons.search_outlined,color: Colors.white, size: 30,),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(4),
                    fillColor: Colors.white,
                    hintText: 'search movie',
                    border: InputBorder.none),
              ),
            ),
            const Icon(Icons.mic,color: Colors.white, size: 25,),
          ],
        ),
      ),
    );
  }
}

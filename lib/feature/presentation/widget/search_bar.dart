import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function submitting;
  // final Function validator;
  final TextEditingController controller;
  const SearchBar(
      {Key? key, required this.submitting, required this.controller})
      : super(key: key);
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
            const Icon(
              Icons.search_outlined,
              color: Colors.white,
              size: 30,
            ),
            Expanded(
              child: RawKeyboardListener(
                focusNode: FocusNode(),
                // onKey: (event) {
                //   if (event.runtimeType == RawKeyDownEvent &&
                //       (event.logicalKey.)) {
                //     debugPrint('Movie name == ${controller.text}');
                //   }
                // },
                child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(4),
                        fillColor: Colors.white,
                        hintText: 'search movie',
                        border: InputBorder.none),
                    onFieldSubmitted: (value){
                      submitting();
                    },
                    // validator: (value){
                    //   value!.isEmpty ? 'Tidak Boleh Kosong' : null;
                    //   validator();
                    // }
                    ),
              ),
            ),
            const Icon(
              Icons.mic,
              color: Colors.white,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}

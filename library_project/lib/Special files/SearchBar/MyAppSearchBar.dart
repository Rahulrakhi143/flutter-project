import 'package:flutter/material.dart';
import 'package:library_project/Special%20files/Padding/paddings.dart';

import '../Values/MyAppValue.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key,required this.onChanged,required this.controller});
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPadding().HomePage,
      child: Container(
        alignment: Alignment.center,
        height: MyValue().SearchBar_height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyValue().SearchBar_circularborder),
          border: Border(
              top: BorderSide(),
              left: BorderSide(),
              right: BorderSide(),
              bottom: BorderSide()
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: MyValue().SearchBar_SizedBox),
            Expanded(child: TextFormField(decoration: InputDecoration(
              hintText: "Search Student",
              border:InputBorder.none,
            ),
              controller: widget.controller,
              onChanged: widget.onChanged,
            )
            ),
            Icon(Icons.search),
            SizedBox(width: MyValue().SearchBar_SizedBox),
          ],
        ),
      ),
    );
  }
}

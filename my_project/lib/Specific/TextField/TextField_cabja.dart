import 'package:flutter/material.dart';

class TextfieldCabja extends StatefulWidget {
  final Controller;
  final color;
  final onTap;
  final onChanged;
  final hint;
  const TextfieldCabja({super.key,this.Controller,this.color,this.onChanged,this.onTap,this.hint});

  @override
  State<TextfieldCabja> createState() => _TextfieldCabjaState();
}

class _TextfieldCabjaState extends State<TextfieldCabja> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.Controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
            fillColor: Colors.green,
        filled: true,
        hintText: widget.hint,
      ),
      onTap: widget.onTap,
      onChanged: widget.onChanged,
    );
  }
}



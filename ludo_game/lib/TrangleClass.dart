import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint for each triangle
    final paintGreen = Paint()..color = Colors.green;
    final paintRed = Paint()..color = Colors.red;
    final paintBlue = Paint()..color = Colors.blue;
    final paintYellow = Paint()..color = Colors.yellow;

    // Top-left triangle
    final pathTopLeft = Path()
      ..moveTo(0,0) // Top-left corner
      ..lineTo(size.width,0) // Top-center
      ..lineTo(size.width/2, size.height/2) // Center-left
      ..close();
    canvas.drawPath(pathTopLeft, paintGreen);

    // Top-right triangle
    final pathTopRight = Path()
      ..moveTo(size.width/2, size.height/2) // Top-center
      ..lineTo(size.width, 0) // Top-right corner
      ..lineTo(size.width, size.height) // Center-right
      ..close();
    canvas.drawPath(pathTopRight, paintYellow);

    // Bottom-left triangle
    final pathBottomLeft = Path()
      ..moveTo(0, 0) // Center-left
      ..lineTo(0, size.height) // Bottom-left corner
      ..lineTo(size.width / 2, size.height/2) // Bottom-center
      ..close();
    canvas.drawPath(pathBottomLeft, paintRed);

    // Bottom-right triangle
    final pathBottomRight = Path()
      ..moveTo(0,size.height) // Bottom-center
      ..lineTo(size.width, size.height) // Bottom-right corner
      ..lineTo(size.width/2, size.height / 2) // Center-right
      ..close();
    canvas.drawPath(pathBottomRight, paintBlue);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
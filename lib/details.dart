import 'package:flutter/material.dart';

class Details {
  static const Color BACKGROUND_COLOR = Color.fromRGBO(58, 53, 53, 1);
  static const Color SECONDARY_COLOR = Color.fromRGBO(123, 120, 120, 0.5);
  static const Color PRIMARY_COLOR = Color.fromRGBO(255, 151, 29, 1);
  static const Color PRIMARY_COLOR_DARK = Color.fromRGBO(194, 108, 9, 1);
  static const Color BLUR_COLOR = Color.fromRGBO(0, 0, 0, 0.16);

  static const List transactions = [
    // today
    [
      ['Sent', 'S-1/1 Lorem ipsum', '\$12'],
      ['Recieved', 'R-1/1 Lorem ipsum', '\$57'],
      ['Sent', 'S-1/2 Lorem ipsum', '\$6'],
      ['Recieved', 'R-1/2 Lorem ipsum', '\$2'],
    ],
    // yesterday
    [
      ['Sent', 'S-2/1 Lorem ipsum ', '\$21'],
      ['Recieved', 'R-2/1 Lorem ipsum ', '\$27'],
    ],
    // day bef. yesterday
    [
      ['Sent', 'S-3/1 Lorem ipsum ', '\$312'],
      ['Recieved', 'R-3/1 Lorem ipsum dolar', '\$317'],
    ],
  ];
}

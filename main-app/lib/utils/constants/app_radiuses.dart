import 'package:flutter/material.dart';

class AppRadiuses {
  AppRadiuses._();

  static const a5 = BorderRadius.all(Radius.circular(5));
  static const a8 = BorderRadius.all(Radius.circular(8));
  static const a15 = BorderRadius.all(Radius.circular(15));
  static const a18 = BorderRadius.all(Radius.circular(18));
  static const a10 = BorderRadius.all(Radius.circular(10));
  static const a12 = BorderRadius.all(Radius.circular(12));
  static const a20 = BorderRadius.all(Radius.circular(15));
  static const a30 = BorderRadius.all(Radius.circular(20));
  static const tl10bl10 = BorderRadius.only(
    bottomLeft: Radius.circular(10),
    topLeft: Radius.circular(10),
  );
  static const tr10br10 = BorderRadius.only(
    topRight: Radius.circular(10),
    bottomRight: Radius.circular(10),
  );
  static const vB10 = BorderRadius.vertical(bottom: Radius.circular(10));
  static const vT10 = BorderRadius.vertical(top: Radius.circular(10));
  static const vT20 = BorderRadius.vertical(top: Radius.circular(20));
  static const vT16 = BorderRadius.vertical(top: Radius.circular(16));
  static const hL5 = BorderRadius.horizontal(left: Radius.circular(5));
  static const hR5 = BorderRadius.horizontal(right: Radius.circular(5));

  static const zero = BorderRadius.all(Radius.zero);
}
import 'package:flutter/material.dart';

class ItemInfo {
  final String name;
  final int amount;
  final Color? color;

  const ItemInfo({required this.name, required this.amount, this.color});
}

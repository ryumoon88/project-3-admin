import 'package:flutter/material.dart';
import 'package:project/models/item_info.dart';

class ItemHistoryInfo extends StatelessWidget {
  final ItemInfo itemInfo;

  const ItemHistoryInfo({super.key, required this.itemInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Text("${itemInfo.amount}x"),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: itemInfo.color,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(itemInfo.name),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/history_info.dart';
import 'package:project/widgets/item_history_info.dart';

class ExpandableHistoryCard extends StatefulWidget {
  const ExpandableHistoryCard({super.key, required this.historyInfo});

  final HistoryInfo historyInfo;

  @override
  _ExpandableHistoryCardState createState() => _ExpandableHistoryCardState();
}

class _ExpandableHistoryCardState extends State<ExpandableHistoryCard> {
  bool isExpanded = false;
  bool showItems = false;

  void toggleExpansion() {
    setState(() {
      if (isExpanded) showItems = !showItems;
      isExpanded = !isExpanded;

      if (isExpanded) {
        Timer(
          const Duration(milliseconds: 400),
          () {
            setState(() {
              showItems = !showItems;
            });
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleExpansion,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded
              ? (widget.historyInfo.items.length * 30) + 100
              : 65, // Specify the expanded and collapsed heights
          child: Card(
            child: Column(
              children: [
                ListTile(
                  leading: Text(widget.historyInfo.id.toString()),
                  title: Text(widget.historyInfo.name),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        const Icon(Icons.date_range),
                        Text(
                          DateFormat("yyyy-MM-dd")
                              .format(widget.historyInfo.date),
                        ),
                      ],
                    ),
                  ),
                ),
                if (showItems)
                  for (int i = 0; i < widget.historyInfo.items.length; i++)
                    ItemHistoryInfo(itemInfo: widget.historyInfo.items[i]),
                showItems
                    ? Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Total"),
                                Text("Rp. 200.000,00")
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          )),
    );
  }
}

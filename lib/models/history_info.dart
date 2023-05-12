import 'package:project/models/item_info.dart';

class HistoryInfo {
  final int id;
  final String name;
  final DateTime date;
  final List<ItemInfo> items;

  HistoryInfo({
    required this.id,
    required this.name,
    required this.date,
    required this.items,
  });
}

import 'package:flutter/material.dart';
import 'package:project/models/card_info.dart';
import 'package:project/models/history_info.dart';
import 'package:project/models/item_info.dart';
import 'package:project/widgets/expandable_history_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardInfo> cardInfoList = [
    CardInfo(title: 'Card 1', subtitle: 'Card 1 information'),
    CardInfo(title: 'Card 2', subtitle: 'Card 2 information'),
    CardInfo(title: 'Card 3', subtitle: 'Card 3 information'),
    CardInfo(title: 'Card 4', subtitle: 'Card 4 information'),
  ];

  List<ItemInfo> itemInfoList1 = [
    const ItemInfo(name: "Kemeja Putih", amount: 2, color: Colors.white),
    const ItemInfo(name: "Kemeja Hitam", amount: 2, color: Colors.black),
  ];
  List<ItemInfo> itemInfoList2 = [
    const ItemInfo(name: "Kemeja Putih", amount: 2, color: Colors.white),
    const ItemInfo(name: "Kemeja Hijau", amount: 2, color: Colors.green),
    const ItemInfo(name: "Kemeja Hitam", amount: 2, color: Colors.black),
  ];
  List<ItemInfo> itemInfoList3 = [
    const ItemInfo(name: "Kemeja Putih", amount: 2, color: Colors.white),
    const ItemInfo(name: "Kemeja Hijau", amount: 2, color: Colors.green),
    const ItemInfo(name: "Kemeja Hitam", amount: 2, color: Colors.black),
    const ItemInfo(name: "Kemeja Putih", amount: 2, color: Colors.white),
    const ItemInfo(name: "Kemeja Hijau", amount: 2, color: Colors.green),
    const ItemInfo(name: "Kemeja Hitam", amount: 2, color: Colors.black),
    const ItemInfo(name: "Kemeja Putih", amount: 2, color: Colors.white),
    const ItemInfo(name: "Kemeja Hijau", amount: 2, color: Colors.green),
    const ItemInfo(name: "Kemeja Hitam", amount: 2, color: Colors.black),
    const ItemInfo(name: "Kemeja Putih", amount: 2, color: Colors.white),
    const ItemInfo(name: "Kemeja Hijau", amount: 2, color: Colors.green),
    const ItemInfo(name: "Kemeja Hitam", amount: 2, color: Colors.black),
  ];

  late List<HistoryInfo> historyInfoList = [
    HistoryInfo(
        id: 0, name: "Naufal", date: DateTime.now(), items: itemInfoList1),
    HistoryInfo(
        id: 0, name: "Bajrul", date: DateTime.now(), items: itemInfoList2),
    HistoryInfo(
        id: 0, name: "Fatur", date: DateTime.now(), items: itemInfoList3)
  ];

  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "Mei",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Okt",
    "Nov",
    "Des"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toko Amril"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Welcome back, Naufal",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (.3 / .2),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: cardInfoList.map(
                  (CardInfo cardInfo) {
                    return Card(
                      child: ListTile(
                        title: Text(cardInfo.title),
                        subtitle: Text(cardInfo.subtitle),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Riwayat",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: months.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 70,
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Specify the border color
                        width: 1.0, // Specify the border width
                      ),
                      borderRadius: BorderRadius.circular(
                          8.0), // Specify the border radius
                    ),
                    child: TextButton(
                      onPressed: () => {},
                      child: Text(
                        months[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // for (var i = 0; i < months.length; i++)
            //   ListTile(
            //     title: Text(months[i]),
            //   )
            for (var i = 0; i < historyInfoList.length; i++)
              ExpandableHistoryCard(historyInfo: historyInfoList[i])
          ],
        ),
      ),
    );
  }
}

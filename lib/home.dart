import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/checkout.dart';
import 'package:statemanagement/tools/cart.dart';
import 'package:statemanagement/tools/items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<items> item = [
    (items("Note 8 pro", 6000)),
    (items("Nokia", 3500)),
    (items("reno", 5000))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return Checkout();
                      },
                    ));
                  },
                  icon: Icon(Icons.add_shopping_cart)),
              Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Consumer<cart>(
                    builder: (context, value, child) {
                      return Text("${value.count}");
                    },
                  )),
            ],
          )
        ],
      ),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return Consumer<cart>(
            builder: (context, value, child) {
              return ListTile(
                  title: Text("${item[index].name}"),
                  subtitle: Text("Smart phone"),
                  trailing: IconButton(
                      onPressed: () {
                        value.add(item[index]);
                      },
                      icon: Icon(Icons.add)));
            },
          );
        },
      ),
    );
  }
}

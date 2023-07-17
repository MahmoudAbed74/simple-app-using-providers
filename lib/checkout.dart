import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/home.dart';
import 'package:statemanagement/tools/cart.dart';
import 'package:statemanagement/tools/items.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Checkout"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.of(context).pop(context);
            },
          ),
          actions: [
            Consumer<cart>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15, top: 15),
                  child: Text(
                    "${value.totalprice}\$",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                );
              },
            )
          ],
        ),
        body: Consumer<cart>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.count,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${value.getitems[index].name}"),
                  subtitle: Text("smart phone"),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      value.remvoe(value.getitems[index]);
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}

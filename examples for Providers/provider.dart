import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class prov extends StatefulWidget {
  const prov({super.key});

  @override
  State<prov> createState() => _provState();
}

class _provState extends State<prov> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => pro(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("provider"),
        ),
        body: Column(
          children: [
            Center(
              child: Consumer<pro>(
                builder: (context, value, child) {
                  print("${value.showdata}");
                  return Text("${value.showdata}");
                },
              ),
            ),
            Consumer<pro>(
              builder: (context, value, child) {
                return ElevatedButton(
                    onPressed: () {
                      value.changeData();
                      print("${value.showdata}");
                    },
                    child: Text("button"));
              },
            )
          ],
        ),
      ),
    );
  }
}

class pro {
  String showdata = "Nice text";

  changeData() {
    showdata = "beautiful text";
  }
}

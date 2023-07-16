import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProveOne(),
      child: Scaffold(
          appBar: AppBar(title: Text("test")),
          body: ListView(
            children: [
              Consumer<ProveOne>(
                builder: (context, value, child) {
                  print("text 1 ");
                  return Column(
                    children: [
                      Center(
                        child: Text("${value.name}"),
                      ),
                      MaterialButton(
                          onPressed: () {
                            value.change_name();
                          },
                          textColor: Colors.black,
                          child: Text("Consumer 1")),
                    ],
                  );
                },
              ),
              Consumer<ProveOne>(
                builder: (context, value, child) {
                  print("text 2 ");
                  return Column(
                    children: [
                      Center(
                        child: Text("${value.name}"),
                      ),
                      MaterialButton(
                        onPressed: () {
                          value.change_name2();
                        },
                        textColor: Colors.red,
                        child: Text("Consumer 2"),
                      )
                    ],
                  );
                },
              ),
              Consumer<ProveOne>(
                builder: (context, value, child) {
                  print("text 3 ");
                  return MaterialButton(
                    onPressed: () {
                      value.change_name();
                    },
                    child: Text("${value.name}"),
                  );
                },
              )
            ],
          )),
    );
  }
}

class ProveOne extends ChangeNotifier {
  String name = "Welcome";
  change_name() {
    name = "Mahmoud";
    notifyListeners();
  }

  change_name2() {
    name = "saad";
    notifyListeners();
  }
}

class ProveTwo extends ChangeNotifier {
  String name = "text2";
  change_name() {
    name = "Mohammed";
    notifyListeners();
  }
}

class Provethree extends ChangeNotifier {
  String name = "button";
  change_name() {
    name = "Success";
    notifyListeners();
  }
}

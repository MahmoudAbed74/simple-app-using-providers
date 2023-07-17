import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/examples for Providers/changenotifierprovider.dart';

class slectorChangeBotifier extends StatefulWidget {
  const slectorChangeBotifier({super.key});

  @override
  State<slectorChangeBotifier> createState() => _slectorChangeBotifierState();
}

class _slectorChangeBotifierState extends State<slectorChangeBotifier> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Selector"),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Selector<Model, String>(
                selector: (context, lastnameselector) => lastnameselector.name,
                builder: (context, value, child) {
                  print("Slector one");
                  return Column(
                    children: [
                      Center(
                        child: Text("$value"),
                      ),
                      Consumer<Model>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                              onPressed: () {
                                value.change_name();
                                print("Consumer 1");
                              },
                              child: Text("Slector one"));
                        },
                      ),
                    ],
                  );
                },
              ),
              Selector<Model, String>(
                builder: (context, value, child) {
                  print("Slector two");
                  return Column(
                    children: [
                      Center(
                        child: Text("${value}"),
                      ),
                      Consumer<Model>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                              onPressed: () {
                                value.change_lastname();
                                print("Consumer 2 ");
                              },
                              child: Text("Slector two"));
                        },
                      ),
                    ],
                  );
                },
                selector: (context, firstname) {
                  return firstname.showname2;
                },
              ),
              Selector<Model, int>(
                builder: (context, value, child) {
                  return Center(
                    child: Text("${value}"),
                  );
                },
                selector: (context, showNuM) => showNuM.shownum,
              ),
              Consumer<Model>(
                builder: (context, value, child) {
                  print("Selector 3");
                  return ElevatedButton(
                      onPressed: () {
                        value.change_num();
                        print("Consumer 3");
                      },
                      child: Text("chang number"));
                },
              )
            ],
          )),
    );
  }
}

class Model extends ChangeNotifier {
  String name = "Welcome";
  String LastName = "hello";
  int num = 1;
  get showname1 => name;
  get showname2 => LastName;
  get shownum => num;
  void change_name() {
    name = "Mahmoud";
    notifyListeners(); //ReBuild Consumer
  }

  void change_lastname() {
    LastName = "abed";
    notifyListeners();
  }

  void change_num() {
    num++;
    notifyListeners();
  }
}

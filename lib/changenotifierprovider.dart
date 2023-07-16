import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class notifierprovider extends StatefulWidget {
  const notifierprovider({super.key});

  @override
  State<notifierprovider> createState() => _notifierproviderState();
}

class _notifierproviderState extends State<notifierprovider> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
          appBar: AppBar(title: Text("Provider")),
          //Consumer is حاويه تتضم محتاج ابديت
          body: Consumer<Model>(
            builder: (context, value, child) {
              return Column(
                children: [
                  //value => method && child => widget && context => builder context
                  Center(
                    child: Text("${value.name}"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        value.change_name();
                      },
                      child: Text("Change name"))
                ],
              );
            },
          )),
    );
  }
}

class Model extends ChangeNotifier {
  String name = "Welcome";
  void change_name() {
    name = "Mahmoud";
    notifyListeners(); //ReBuild Consumer
  }
}

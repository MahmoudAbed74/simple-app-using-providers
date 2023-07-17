import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class contextt extends StatefulWidget {
  const contextt({super.key});

  @override
  State<contextt> createState() => _contexttState();
}

class _contexttState extends State<contextt> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => prove(),
      child: name(),
    );
  }
}

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    // reBuild the " Widget build(BuildContext context) {}"
    var proveContext = Provider.of<prove>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Context OF Provider"),
      ),
      body: Column(
        children: [
          Center(
            child: Text("${proveContext.name}"),
          ),
          ElevatedButton(
              onPressed: () {
                proveContext.changeName();
                print(proveContext.name);
              },
              child: Text("change provider")),
        ],
      ),
    );
  }
}

class prove extends ChangeNotifier {
  String name = "Welcome";

  changeName() {
    name = "Ali";
    notifyListeners();
  }
}

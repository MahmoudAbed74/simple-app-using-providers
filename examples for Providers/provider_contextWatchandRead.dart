import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/examples for Providers/Provider_context.dart';
import 'package:statemanagement/examples for Providers/changenotifierprovider.dart';

class watchandread extends StatefulWidget {
  const watchandread({super.key});

  @override
  State<watchandread> createState() => _watchandreadState();
}

class _watchandreadState extends State<watchandread> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => provid(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Watch and read"),
          ),
          body: name(),
        ));
  }
}

class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text("${context.watch<provid>().name}"),
        ),
        ElevatedButton(
            onPressed: () {
              context.read<provid>().changename();
            },
            child: Text("read and watch context"))
      ],
    );
  }
}

class provid extends ChangeNotifier {
  String name = "Hello!";
  changename() {
    name = "Kamel";
    notifyListeners();
  }
}


// context.watch<provid>().name == Provider.of<provid>(context.listen:true)
//  context.Read<provid>().name == Provider.of<provid>(context.listen:flase)
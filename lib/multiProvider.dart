import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class multi extends StatefulWidget {
  const multi({super.key});

  @override
  State<multi> createState() => _multiState();
}

class _multiState extends State<multi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("multi Provider")),
      body: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => provid1(),
          child: Column(
            children: [
              Consumer<provid1>(
                builder: (context, value, child) {
                  return Center(
                    child: Text("${value.showdata}"),
                  );
                },
              ),
              Consumer<provid1>(
                builder: (context, value, child) {
                  return ElevatedButton.icon(
                      onPressed: () {
                        return value.changedata();
                      },
                      icon: Icon(Icons.change_circle),
                      label: Text("change data"));
                },
              ),
            ],
          ),
        ),
        Provider(
          create: (context) => provid2(),
          child: Column(
            children: [
              Consumer<provid2>(
                builder: (context, value, child) {
                  return Center(
                    child: Text("${value.name}"),
                  );
                },
              ),
              Consumer<provid2>(
                builder: (context, value, child) {
                  return ElevatedButton.icon(
                      onPressed: () {
                        value.changename();
                        print("${value.name}");
                      },
                      icon: Icon(Icons.change_circle),
                      label: Text("change data"));
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class provid1 extends ChangeNotifier {
  String showdata = "Hello";
  changedata() {
    showdata = "Thanks";
  }
}

class provid2 {
  String name = "ali";
  changename() {
    name = "mahmoud";
  }
}

// MultiProvider => combine multiple providers into a single widget tree
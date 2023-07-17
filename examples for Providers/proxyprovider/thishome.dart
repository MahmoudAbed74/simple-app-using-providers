import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class proxyprov extends StatelessWidget {
  const proxyprov({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<mymodel>(
          create: (context) {
            return mymodel();
          },
        ),
        ProxyProvider<mymodel, anthor>(
          update: (context, value, previous) {
            return anthor(value);
          },
        )
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text("ProxyProvider"),
          ),
          body: Column(
            children: [
              Consumer<mymodel>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      Center(child: Text("${value.name}")),
                      Center(
                        child: ElevatedButton(
                          child: Text("cahhnge notifier"),
                          onPressed: () {
                            value.changename("Mahmoud");
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
              Consumer<anthor>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      Center(child: Text("${value.model.name}")),
                      Center(
                        child: ElevatedButton(
                          child: Text("proxy provider"),
                          onPressed: () {
                            value.changesecondname();
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          )),
    );
  }
}

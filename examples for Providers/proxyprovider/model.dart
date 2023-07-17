import 'package:flutter/widgets.dart';

class mymodel extends ChangeNotifier {
  String name = "Welcome";

  changename(String val) {
    name = val;
    notifyListeners();
  }
}

class anthor {
  mymodel model;
  anthor(this.model);
  changesecondname() {
    model.changename("Mohammed");
  }
}

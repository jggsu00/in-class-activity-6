import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MyApp(),
    ),
  );
}


class Counter with ChangeNotifier {
  int value = 0;
  void increment() {
    if (value < 99) {
      value++;
      notifyListeners();
    }
  }


  void decrement() {
    if (value > 0) {
      value--;
      notifyListeners();
    }
  }
}


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


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Counter'),
        backgroundColor: Colors.white, // Set app bar to light blue
      ),
      body: Consumer<Counter>(
        builder: (context, counter, child) {
          String message;
          Color backgroundColor = Colors.white; // Default background to white

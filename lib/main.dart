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
        backgroundColor: Colors.white,
      ),
      body: Consumer<Counter>(
        builder: (context, counter, child) {
          String message;
          Color backgroundColor = Colors.white;


          if (counter.value <= 12) {
            message = "You're a child!";
            backgroundColor = Colors.lightBlue;
          } else if (counter.value <= 19) {
            message = "Teenager time!";
            backgroundColor = Colors.lightGreen;
          } else if (counter.value <= 30) {
            message = "You're a young adult!";
            backgroundColor = Colors.yellow.shade200;
          } else if (counter.value <= 50) {
            message = "You're an adult now!";
            backgroundColor = Colors.orange;
          } else {
            message = "Golden years!";
            backgroundColor = Colors.grey.shade300;
          }


          return Container(
            color: backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Age: ${counter.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  message,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: counter.increment,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      child: const Text('Increase Age', style: TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: counter.decrement,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      child: const Text('Decrease Age', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

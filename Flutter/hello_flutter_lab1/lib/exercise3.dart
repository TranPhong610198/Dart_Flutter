import 'package:flutter/material.dart';

void main() => runApp(const MyAppExer3());

class MyAppExer3 extends StatelessWidget {
  const MyAppExer3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lab1 De Cai DCMN Mo'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flutter_dash_sharp, size: 100,color: Colors.pinkAccent),
              SizedBox(height: 10,),
              Text(
                'Hế Lô Em Zai',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text(
                '🫰 Bố mày là Flutter Dash 🏸',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.smart_button),
        ),
      ),
    );
  }
}

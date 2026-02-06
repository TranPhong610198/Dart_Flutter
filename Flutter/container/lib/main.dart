import 'package:flutter/material.dart';

void main() {
  runApp(const ContainerApp());
}

class ContainerApp extends StatelessWidget {
  const ContainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeWidget(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeWidget extends StatefulWidget {
  final String title;

  const HomeWidget({super.key, required this.title});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {

  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Bắt buộc phải dispose controller
    super.dispose();
  }

  void _spin() {
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: Colors.redAccent,
          ),
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(_animation.value),
            child: const Icon(
              Icons.airplanemode_active,
              size: 150.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _spin,
        tooltip: 'Rotate',
        child: const Icon(Icons.rotate_right),
      ),
    );
  }
}

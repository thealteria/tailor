import 'package:flutter/material.dart';
import 'package:tailor_flutter/tailor_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tailor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tailor Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _size = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TailorAppBar(
        builder: (_, size) {
          return AppBar(
            title: Text('AppBar width: ${size.width} height: ${size.height}'),
          );
        },
      ),
      body: Center(
        child: Tailor(
          builder: (_, size, child) {
            return Container(
              color: Colors.red,
              height: _size,
              width: _size,
              alignment: Alignment.center,
              child: Text(
                "Size: ${size.toString()}",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _decreaseSize,
            tooltip: 'Decrease Size',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _increaseSize,
            tooltip: 'Increase Size',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _increaseSize() {
    setState(() {
      _size += 100;
    });
  }

  void _decreaseSize() {
    if (_size <= 100) return;

    setState(() {
      _size -= 100;
    });
  }
}

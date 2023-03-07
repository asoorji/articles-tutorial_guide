import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Builder Demo',
      home: RandomNumbersScreen(),
    );
  }
}

class RandomNumbersScreen extends StatefulWidget {
  @override
  _RandomNumbersScreenState createState() => _RandomNumbersScreenState();
}

class _RandomNumbersScreenState extends State<RandomNumbersScreen> {
  late Stream<int> _randomNumbersStream;

  @override
  void initState() {
    super.initState();
    _randomNumbersStream =
        Stream.periodic(Duration(seconds: 1), (i) => Random().nextInt(100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Numbers'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _randomNumbersStream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Random number: ${snapshot.data}',
                style: TextStyle(fontSize: 24),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

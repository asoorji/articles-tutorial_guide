import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
        title: 'Demo Application',
        debugShowCheckedModeBanner: false,
        home: const LikeButton());
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key}) : super(key: key);
  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  int _count = 8;
  void decision() {
    if (_count == 8) {
      _count++;
    } else {
      _count--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Stateful Widget',
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: (_count == 9
                  // ignore: prefer_const_constructors
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  // ignore: prefer_const_constructors
                  : Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    )),
              onPressed: () {
                decision();
              },
            ),
            Text('$_count' ' loves'),
            Text(_count == 8
                ? 'Aso Orji  and 7 others'
                : 'You, Aso Orji  and 7 others')
          ],
        ),
      ),
    );
  }
}







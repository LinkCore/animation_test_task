import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SquareAnimation(),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({Key? key}) : super(key: key);

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

class SquareAnimationState extends State<SquareAnimation> {

  double squarePosition = 170;
  double squareSize = 70.0;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    left: squarePosition,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(seconds: 1),
                    child: Container(
                      width: squareSize,
                      height: squareSize,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => setState(() {
                      if(squarePosition > 9) {
                        squarePosition = squarePosition - 10;
                      }
                    }), child: const Text("To the left")),
                const SizedBox(width: 5),
                ElevatedButton(
                    onPressed: () => setState(() {
                      if(MediaQuery.of(context).size.width - (squarePosition + squareSize) > 9) {
                        squarePosition = squarePosition + 10;
                      }
                    }), child: const Text("To the right"))
              ],
            )
          ],
        ),
    );
  }
}

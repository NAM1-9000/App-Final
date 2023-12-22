import 'dart:math';

import 'package:flutter/material.dart';

class Q2UI extends StatefulWidget {
  const Q2UI({super.key});

  @override
  State<Q2UI> createState() => _Q2UIState();
}

class _Q2UIState extends State<Q2UI> {
  Widget _buildCircle(Color color) {
    return CustomPaint(
      size: const Size(30, 30),
      painter: _CirclePainter(color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          "Recommended for \nyour deices",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.start,
        ),
        actions: const [
          Text(
            "see all",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.bookmark_outline_outlined, color: Colors.blue),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            "assets/airpods max.png",
            scale: 2,
          ),
          const Text('Free Engraving', style: TextStyle(color: Colors.orange)),
          const Text(
            'AirPods Max -- Silver',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const Text(
            'A\$899.00',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCircle(const Color.fromARGB(255, 43, 42, 42)),
              const SizedBox(width: 10),
              _buildCircle(const Color.fromARGB(255, 255, 117, 117)),
              const SizedBox(width: 10),
              _buildCircle(Colors.grey),
              const SizedBox(width: 10),
              _buildCircle(Colors.white),
              const SizedBox(width: 10),
              const Text("+1 more",
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final Color color;

  _CirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..color = color;
    final paint2 = Paint()..color = color.withOpacity(0.5);

    canvas.drawArc(
      Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height),
      0,
      pi,
      false,
      paint1,
    );

    canvas.drawArc(
      Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height),
      pi,
      pi,
      false,
      paint2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

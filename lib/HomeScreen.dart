import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F8FA),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundCirclesPainter(),
            ),
          ),
          // Top Right Icon
          Positioned(
            top: 100,
            right: 30,
            child: Image.asset(
              'assets/pie_chart_icon.png',
              width: 60,
              height: 60,
            ),
          ),
          Positioned(
            top: 450,
            left: 40,
            child: Image.asset(
              'assets/dollar_icon.png',
              width: 60,
              height: 60,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Central Text
              Center(
                child: Text(
                  "Spend Smarter\nSave More",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4E9A7D), // Exact color from the image
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 400), // Space between text and button
              // Get Started Button
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF42BBA4), Color(0xFF209D86)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Log In Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have Account? ",
                    style: TextStyle(
                      color: Color(0xFF4C6F6A),
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Color(0xFF209D86), // Exact color from the image
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BackgroundCirclesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFE5F2F0) // Background circle color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width * 0.8;

    for (double radius = maxRadius; radius > 0; radius -= maxRadius / 4) {
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

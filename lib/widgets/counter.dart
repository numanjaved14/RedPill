import 'package:flutter/material.dart';

// import 'constant.dart';

class Counter extends StatelessWidget {
  final String number;
  final Color color;
  final String title;
  const Counter({
    Key? key,
    required this.number,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          number,
          style: TextStyle(
            fontSize: 30,
            color: color,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF303030),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

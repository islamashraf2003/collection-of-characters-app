import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String name;
  final String vlaue;

  const CustomText({
    super.key,
    required this.name,
    required this.vlaue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                '$name : ',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white),
              ),
              Text(
                '$vlaue',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 185, 182, 182),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

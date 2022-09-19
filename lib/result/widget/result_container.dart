import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {
  final String title;
  final String result;
  final Color color;
  const ResultContainer(
      {Key? key,
      required this.title,
      required this.result,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$title: ',
          style: TextStyle(fontSize: 16, color: color),
        ),
        Text(
          result,
          style: TextStyle(
              fontSize: 18, color: color, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

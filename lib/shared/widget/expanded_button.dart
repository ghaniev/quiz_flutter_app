import 'package:flutter/material.dart';
import 'package:quiz_app/shared/utils/constants.dart';

class ExpandedButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const ExpandedButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      ),
    );
  }
}

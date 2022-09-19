import 'package:flutter/material.dart';
import 'package:quiz_app/shared/shared.dart';

class AnswerContainer extends StatefulWidget {
  final String answer;
  final Function() onPressed;
  const AnswerContainer(
      {Key? key, required this.answer, required this.onPressed})
      : super(key: key);

  @override
  State<AnswerContainer> createState() => _AnswerContainerState();
}

class _AnswerContainerState extends State<AnswerContainer> {
  bool isPicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPicked = true;
        });
        widget.onPressed();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isPicked ? kPrimary : kElevation,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.answer,
                style: const TextStyle(
                  color: kBasic,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (isPicked) const Icon(Icons.check_box_outlined, color: kPrimary),
            if (!isPicked)
              const Icon(Icons.check_box_outline_blank_rounded,
                  color: kElevation),
          ],
        ),
      ),
    );
  }
}

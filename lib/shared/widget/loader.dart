import 'package:flutter/material.dart';
import 'package:quiz_app/shared/shared.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: kPrimary),
    );
  }
}

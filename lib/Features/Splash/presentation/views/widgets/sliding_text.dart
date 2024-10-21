import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.slidingAniimation,
  }) : super(key: key);

  final Animation<Offset> slidingAniimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAniimation,
      builder: (context,_) {
        return SlideTransition(
          position: slidingAniimation,
          child: const Text(
            'Read Free Books',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    );
  }
}
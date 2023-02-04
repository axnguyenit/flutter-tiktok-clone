import 'package:flutter/material.dart';

class CircleAnimation extends StatefulWidget {
  final Widget child;
  const CircleAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<CircleAnimation> createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 5000,
      ),
    );

    _setUpAnimation();
  }

  void _setUpAnimation() {
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.repeat();
  }

  @override
  void didUpdateWidget(CircleAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    _setUpAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.child,
    );
  }
}

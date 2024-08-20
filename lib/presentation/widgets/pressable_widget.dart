import 'package:flutter/material.dart';

class PressableWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const PressableWidget({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  _PressableWidgetState createState() => _PressableWidgetState();
}

class _PressableWidgetState extends State<PressableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    if (_isPressed) {
      widget.onPressed?.call();
    }
    _reset();
  }

  void _onTapCancel() {
    _reset();
  }

  void _reset() {
    setState(() {
      _isPressed = false;
    });
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ScaleTransition(
        scale: _animation,
        child: widget.child,
      ),
    );
  }
}

import 'package:flutter/widgets.dart';

/// Pops the current route once on a rightward horizontal swipe.
class SwipeBackDetector extends StatefulWidget {
  const new({required this.child, super.key});

  final Widget child;

  @override
  State<SwipeBackDetector> createState() => _SwipeBackDetectorState();
}

class _SwipeBackDetectorState extends State<SwipeBackDetector> {
  static const _threshold = 50;

  Offset? _start;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) => _start = details.globalPosition,
      onHorizontalDragUpdate: (details) {
        final start = _start;
        if (start == null ||
            details.globalPosition.dx - start.dx <= _threshold) {
          return;
        }
        _start = null;
        Navigator.of(context).pop();
      },
      onHorizontalDragEnd: (_) => _start = null,
      child: widget.child,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class PageDismissWraper extends StatefulWidget {
  const PageDismissWraper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<PageDismissWraper> createState() => _PageDismissWraperState();
}

class _PageDismissWraperState extends State<PageDismissWraper> {
  Offset triggerPoint = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails details) {
        triggerPoint = details.globalPosition;
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (triggerPoint.dx < details.globalPosition.dx - 50) {
          Navigator.pop(context);
        }
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        triggerPoint = Offset.zero;
      },
      child: widget.child,
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

class ExpandableFabAction {
  const new({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;
}

/// A plus button that blurs the screen and fans out [actions] above it.
class ExpandableFab extends StatefulWidget {
  const new({required this.actions, super.key});

  final List<ExpandableFabAction> actions;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  static const _size = Size(56, 56);

  final _overlay = OverlayPortalController();
  final _link = LayerLink();
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
  );
  late final _fade = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );
  late final Animation<Offset> _slide = Tween<Offset>(
    begin: const Offset(0, 0.4),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  late final Animation<double> _rotation = Tween<double>(
    begin: 0,
    end: 0.125,
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isOpen = false;

  Future<void> _open() async {
    setState(() => _isOpen = true);
    _overlay.show();
    await _controller.forward();
  }

  Future<void> _close() async {
    await _controller.reverse();
    if (!mounted) return;
    _overlay.hide();
    setState(() => _isOpen = false);
  }

  void _select(ExpandableFabAction action) {
    _controller.value = 0;
    _overlay.hide();
    setState(() => _isOpen = false);
    action.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return OverlayPortal(
      controller: _overlay,
      overlayChildBuilder: (_) => Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) => BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: _controller.value * 3.5,
                  sigmaY: _controller.value * 3.5,
                ),
                child: child,
              ),
              child: GestureDetector(
                onTap: _close,
                child: FadeTransition(
                  opacity: _controller,
                  child: ColoredBox(color: Colors.black.withValues(alpha: .25)),
                ),
              ),
            ),
          ),
          CompositedTransformFollower(
            link: _link,
            targetAnchor: Alignment.bottomRight,
            followerAnchor: Alignment.bottomRight,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final action in widget.actions) ...[
                    FadeTransition(
                      opacity: _fade,
                      child: SlideTransition(
                        position: _slide,
                        child: IconButton(
                          onPressed: () => _select(action),
                          icon: Icon(action.icon),
                          style: IconButton.styleFrom(
                            backgroundColor: color,
                            fixedSize: const Size(50, 50),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  _mainButton(color, onPressed: _close),
                ],
              ),
            ),
          ),
        ],
      ),
      child: CompositedTransformTarget(
        link: _link,
        child: Opacity(
          opacity: _isOpen ? 0 : 1,
          child: _mainButton(color, onPressed: _open),
        ),
      ),
    );
  }

  Widget _mainButton(Color color, {required VoidCallback onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: RotationTransition(
        turns: _rotation,
        child: const Icon(Icons.add_rounded),
      ),
      style: IconButton.styleFrom(backgroundColor: color, fixedSize: _size),
    );
  }
}

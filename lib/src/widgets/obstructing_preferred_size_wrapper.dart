import 'package:flutter/cupertino.dart';

/// A widget that wraps a PreferredSizeWidget to implement ObstructingPreferredSizeWidget.
/// This is useful when you need to pass a PreferredSizeWidget (like PreferredSize)
/// to CupertinoPageScaffold, which requires ObstructingPreferredSizeWidget.
/// 
/// Note: This wrapper ALWAYS wraps the widget, even if it's already an
/// ObstructingPreferredSizeWidget, to ensure type safety with CupertinoPageScaffold.
class ObstructingPreferredSizeWrapper extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  /// Creates a wrapper around a PreferredSizeWidget.
  const ObstructingPreferredSizeWrapper({
    required this.child,
    super.key,
  });

  /// The PreferredSizeWidget to wrap.
  /// Since PreferredSizeWidget extends Widget, we can safely cast it.
  final PreferredSizeWidget child;

  @override
  Size get preferredSize => child.preferredSize;

  @override
  Widget build(BuildContext context) {
    // PreferredSizeWidget extends Widget, so we can use it directly as a Widget
    // No need to call build() since child is already a Widget
    return child;
  }

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}


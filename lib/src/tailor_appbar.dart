import 'package:flutter/material.dart';

typedef TailorWidgetBuilder = Widget Function(BuildContext context, Size size);

class TailorAppBar extends PreferredSize {
  /// Wrap your AppBar with [Tailor] and get the size of the AppBar with [builder]

  const TailorAppBar({
    super.key,
    super.child = const SizedBox.shrink(),
    required this.builder,
    super.preferredSize = const Size.fromHeight(kToolbarHeight),
  });

  /// [builder] will be called whenever the size of the widget changes
  final TailorWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Size> notifier = ValueNotifier(Size.zero);

    return ValueListenableBuilder<Size>(
      valueListenable: notifier,
      builder: (_, size, child) {
        WidgetsBinding.instance.endOfFrame.then(
          (_) =>
              notifier.value = (context.findRenderObject() as RenderBox).size,
        );

        return builder(_, size);
      },
    );
  }
}

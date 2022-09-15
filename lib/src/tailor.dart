import 'package:flutter/material.dart';

class Tailor extends StatelessWidget {
  /// Wrap your widget with [Tailor] and get the size of the widget with [builder]

  const Tailor({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  /// [builder] will be called whenever the size of the widget changes
  final ValueWidgetBuilder<Size> builder;

  /// A [valueListenable]-independent widget which is passed back to the [builder].
  ///
  /// This argument is optional and can be null
  final Widget? child;

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

        return builder(_, size, child);
      },
      child: child,
    );
  }
}

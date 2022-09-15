# Tailor
[![MIT License](https://img.shields.io/badge/License-MIT-red.svg)](https://choosealicense.com/licenses/mit/)

Flutter widget that calculates the size of a widget in runtime.
# Usage

Just wrap your widget with `Tailor` and get the size in the `builder`.
The `builder` will return the size whenever the size of the widget changes.
```dart
Tailor(
  builder: (_, size, child) {
    return Container(
      color: Colors.red,
      height: 100,
      width: 100,
      alignment: Alignment.center,
      child: Text(
        "Size: ${size.toString()}",
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
  },
);
```

<br />We can get the size of any widget using `Tailor` widget but what if we want to get the size of the `AppBar` when it's placed in the `Scaffold`?\
Then the `Tailor` widget will not work and you can't wrap it around the `AppBar` as it's a normal `Widget` and `AppBar` is a `PreferredSizeWidget`.
```dart
class AppBar extends StatefulWidget implements PreferredSizeWidget {
```

<br />So to tackle this problem we've `TailorAppBar`. Just wrap the `AppBar` with `TailorAppBar` widget when it's placed in the `Scaffold` and voila! You'll get the size of your `AppBar`.
```dart
Scaffold(
  appBar: TailorAppBar(
    builder: (_, size) {
      return AppBar(
        title: Text('AppBar width: ${size.width} height: ${size.height}'),
      );
    },
  ),
);
```

import 'package:flutter/material.dart';
import 'package:football/widgets/widgets.dart';

/// Builds a [FootballButton] as a [PopupMenuEntry] for a [PopupMenuButton].
class FootballPopupMenuItem<T> extends PopupMenuEntry<T> {
  const FootballPopupMenuItem(
      {this.value, this.enabled = true, this.icon, this.text, Key? key})
      : super(key: key);

  /// The value that will be returned by [showMenu] if this entry is selected.
  final T? value;

  /// Whether the user is permitted to select this item.
  final bool enabled;

  final Widget? icon;
  final Widget? text;

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(T? value) => value == this.value;

  @override
  FootballPopupMenuItemState<T, FootballPopupMenuItem<T>> createState() =>
      FootballPopupMenuItemState<T, FootballPopupMenuItem<T>>();
}

class FootballPopupMenuItemState<T, W extends FootballPopupMenuItem<T>>
    extends State<W> {
  @override
  Widget build(BuildContext context) {
    return FootballButton.flat(
      icon: widget.icon,
      iconSize: 20,
      text: widget.text,
      dense: true,
      onTap: widget.enabled
          ? () => Navigator.of(context).pop<T>(widget.value)
          : null,
    );
  }
}

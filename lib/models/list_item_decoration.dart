part of '../custom_dropdown.dart';

class ListItemDecoration {
  /// Hover color for [DropdownFlutter] list item area.
  ///
  /// Default to [Colors.transparent].
  final Color? hoverColor;

  /// Splash color for [DropdownFlutter] list item area.
  ///
  /// Default to [Colors.transparent].
  final Color? splashColor;

  /// Highlight color for [DropdownFlutter] list item area.
  ///
  /// Default to Color(0xFFEEEEEE).
  final Color? highlightColor;

  /// Selected color for [DropdownFlutter] list item area.
  ///
  /// Default to Color(0xFFF5F5F5).
  final Color? selectedColor;

  /// Selected icon color for [DropdownFlutter] list item area.
  /// Useless if [listItemBuilder] provided.
  final Color? selectedIconColor;

  /// Selected icon border for [DropdownFlutter] list item area.
  /// Useless if [listItemBuilder] provided.
  final BorderSide? selectedIconBorder;

  /// Selected icon shape for [DropdownFlutter] list item area.
  /// Useless if [listItemBuilder] provided.
  final OutlinedBorder? selectedIconShape;

  const ListItemDecoration({
    this.splashColor,
    this.highlightColor,
    this.selectedColor,
    this.selectedIconColor,
    this.selectedIconBorder,
    this.selectedIconShape,
    this.hoverColor,
  });

  static const _defaultSplashColor = Colors.transparent;
  static const _defaultHoverColor = Colors.transparent;
  static const _defaultHighlightColor = Color(0xFFEEEEEE);
  static const _defaultSelectedColor = Color(0xFFF5F5F5);
}

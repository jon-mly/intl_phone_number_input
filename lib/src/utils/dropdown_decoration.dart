import 'package:flutter/material.dart';

/// [DropdownDecoration] contains selector button configurations
class DropdownDecoration {
  /// [showFlags], displays flag along side countries info on selector button
  /// and list items within the selector
  final bool showFlags;

  /// [showEmoji], uses emoji flags instead of png assets
  final bool showEmoji;

  /// [setSelectorButtonAsPrefixIcon], this sets/places the selector button inside the [TextField] as a prefixIcon.
  final bool setSelectorButtonAsPrefixIcon;

  /// Space before the flag icon
  final double? leadingPadding;

  /// Space between the flag and the dial code
  final double? paddingFlagDialCode;

  /// Add white space for short dial code
  final bool trailingSpace;

  /// Background color of the dropdown selector
  final Color? dropdownBackgroundColor;

  /// Border radius of the dropdown
  final double? dropdownBorderRadius;

  const DropdownDecoration({
    this.showFlags = true,
    this.showEmoji = false,
    this.setSelectorButtonAsPrefixIcon = false,
    this.leadingPadding,
    this.paddingFlagDialCode,
    this.trailingSpace = true,
    this.dropdownBackgroundColor,
    this.dropdownBorderRadius,
  });
}

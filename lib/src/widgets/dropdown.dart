import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';
import 'package:intl_phone_number_input/src/utils/dropdown_decoration.dart';
import 'package:intl_phone_number_input/src/utils/test/test_helper.dart';
import 'package:intl_phone_number_input/src/widgets/item.dart';

/// [Dropdown]
class Dropdown extends StatelessWidget {
  final List<Country> countries;
  final Country? country;
  final DropdownDecoration dropdownDecoration;
  final TextStyle? selectorTextStyle;
  final InputDecoration? searchBoxDecoration;
  final bool autoFocusSearchField;
  final String? locale;
  final bool isEnabled;
  final bool isScrollControlled;

  final ValueChanged<Country?> onCountryChanged;

  const Dropdown({
    Key? key,
    required this.countries,
    required this.country,
    required this.dropdownDecoration,
    required this.selectorTextStyle,
    required this.searchBoxDecoration,
    required this.autoFocusSearchField,
    required this.locale,
    required this.onCountryChanged,
    required this.isEnabled,
    required this.isScrollControlled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return countries.isNotEmpty && countries.length > 1
        ? DropdownButtonHideUnderline(
            child: DropdownButton<Country>(
              key: Key(TestHelper.DropdownButtonKeyValue),
              hint: Item(
                country: country,
                showFlag: dropdownDecoration.showFlags,
                useEmoji: dropdownDecoration.showEmoji,
                leadingPadding: dropdownDecoration.leadingPadding,
                trailingSpace: dropdownDecoration.trailingSpace,
                paddingFlagDialCode: dropdownDecoration.paddingFlagDialCode,
                textStyle: selectorTextStyle,
              ),
              value: country,
              items: mapCountryToDropdownItem(countries),
              onChanged: isEnabled ? onCountryChanged : null,
              dropdownColor: dropdownDecoration.dropdownBackgroundColor,
              borderRadius: dropdownDecoration.dropdownBorderRadius != null
                  ? BorderRadius.circular(
                      dropdownDecoration.dropdownBorderRadius!)
                  : null,
            ),
          )
        : Item(
            country: country,
            showFlag: dropdownDecoration.showFlags,
            useEmoji: dropdownDecoration.showEmoji,
            leadingPadding: dropdownDecoration.leadingPadding,
            trailingSpace: dropdownDecoration.trailingSpace,
            paddingFlagDialCode: dropdownDecoration.paddingFlagDialCode,
            textStyle: selectorTextStyle,
          );
  }

  /// Converts the list [countries] to `DropdownMenuItem`
  List<DropdownMenuItem<Country>> mapCountryToDropdownItem(
      List<Country> countries) {
    return countries.map((country) {
      return DropdownMenuItem<Country>(
        value: country,
        child: Item(
          key: Key(TestHelper.countryItemKeyValue(country.alpha2Code)),
          country: country,
          showFlag: dropdownDecoration.showFlags,
          useEmoji: dropdownDecoration.showEmoji,
          textStyle: selectorTextStyle,
          paddingFlagDialCode: dropdownDecoration.paddingFlagDialCode,
          withCountryNames: false,
          trailingSpace: dropdownDecoration.trailingSpace,
        ),
      );
    }).toList();
  }
}

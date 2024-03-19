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
  final String? locale;
  final bool isEnabled;

  final ValueChanged<Country?> onCountryChanged;

  const Dropdown({
    Key? key,
    required this.countries,
    required this.country,
    required this.dropdownDecoration,
    required this.selectorTextStyle,
    required this.locale,
    required this.onCountryChanged,
    required this.isEnabled,
  }) : super(key: key);

  /// Converts the list [countries] to `DropdownMenuItem`
  List<DropdownMenuItem<Country>> mapCountryToDropdownItem(
      List<Country> countries) {
    return countries.map(
      (country) {
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
            trailingPadding: dropdownDecoration.trailingPadding,
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<Country>(
        key: Key(TestHelper.DropdownButtonKeyValue),
        hint: Item(
          country: country,
          showFlag: dropdownDecoration.showFlags,
          useEmoji: dropdownDecoration.showEmoji,
          leadingPadding: dropdownDecoration.leadingPadding,
          trailingPadding: dropdownDecoration.trailingPadding,
          paddingFlagDialCode: dropdownDecoration.paddingFlagDialCode,
          textStyle: selectorTextStyle,
        ),
        value: country,
        items: mapCountryToDropdownItem(countries),
        onChanged: isEnabled ? onCountryChanged : null,
        dropdownColor: dropdownDecoration.dropdownBackgroundColor,
        borderRadius: dropdownDecoration.dropdownBorderRadius != null
            ? BorderRadius.circular(dropdownDecoration.dropdownBorderRadius!)
            : null,
      ),
    );
  }
}

import 'dart:developer';

import 'package:dropdown_flutter_fork/custom_dropdown.dart';
import 'package:flutter/material.dart';

const _list = [
  'Bangladesh',
  'Australia',
  'Malaysia',
  'America',
  'Canada',
  'India',
  'Pakistan',
  'Sri Lanka',
  'Nepal',
  'Bhutan',
  'Japan',
];

class SearchDropdown extends StatefulWidget {
  const SearchDropdown({super.key});

  @override
  State<SearchDropdown> createState() => _SearchDropdownState();
}

class _SearchDropdownState extends State<SearchDropdown> {
  String? selectedItem = _list[2];

  @override
  Widget build(BuildContext context) {
    return DropdownFlutter<String>.search(
      hintText: 'Select Country',
      items: _list,
      initialItem: selectedItem,
      overlayHeight: 342,
      onChanged: (value) {
        log('SearchDropdown onChanged value: $value');
        setState(() {
          selectedItem = value;
        });
      },
      hideSelectedFieldWhenExpanded: true,
      decoration: CustomDropdownDecoration(
        // additionalOverlayOffset: Offset(0, 45),
        searchFieldDecoration: SearchFieldDecoration(
          border: InputBorder.none,
          outLineInnerBorderDecoration: BoxDecoration(
            border: const Border(
              left: BorderSide(
                color: Colors.red,
                width: 3,
              ),
            ), borderRadius: BorderRadius.circular(2),
          ),
          outLineOuterBorderDecoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 2
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        closedBorder: Border(
          left: BorderSide(
            color: Colors.red,
            width: 3,
          ),
        ),
        closedBorderRadius: BorderRadius.circular(4),
        outLineBorderDecoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}

class MultiSelectSearchDropdown extends StatelessWidget {
  const MultiSelectSearchDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownFlutter<String>.multiSelectSearch(
      hintText: 'Select Country',
      items: _list,
      onListChanged: (value) {
        log('MultiSelectSearchDropdown onChanged value: $value');
      },
    );
  }
}

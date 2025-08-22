import 'dart:developer';

import 'package:dropdown_flutter_fork/custom_dropdown.dart';
import 'package:flutter/material.dart';

const List<String> _list = [
  'Developer',
  'Designer',
  'Consultant',
  'Student',
];

class SimpleDropdown extends StatelessWidget {
  const SimpleDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownFlutter<String>(
      hintText: 'Select job role',
      items: _list,
      initialItem: _list[0],
      excludeSelected: false,
      onChanged: (value) {
        log('SimpleDropdown onChanged value: $value');
      },
      overrideShowHintTextWhenExpanded: true,
      decoration: CustomDropdownDecoration(
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

import 'dart:developer';

import 'package:dropdown_flutter_fork/custom_dropdown.dart';
import 'package:dropdown_flutter_example/model/model.dart';
import 'package:flutter/material.dart';

class MultiSelectControllerDropdown extends StatefulWidget {
  const MultiSelectControllerDropdown({super.key});

  @override
  State<MultiSelectControllerDropdown> createState() =>
      _MultiSelectControllerDropdownState();
}

class _MultiSelectControllerDropdownState
    extends State<MultiSelectControllerDropdown> {
  final controller = MultiSelectController<JobType>([]);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownFlutter<JobType>.multiSelect(
          multiSelectController: controller,
          hintText: 'Select job role',
          items: jobItems,
          decoration: CustomDropdownDecoration(
            closedSuffixIcon: InkWell(
              onTap: () {
                log('Clearing MultiSelectControllerDropdown');
                controller.clear();
              },
              child: const Icon(Icons.close),
            ),
            expandedSuffixIcon: InkWell(
              onTap: () {
                log('Clearing MultiSelectControllerDropdown');
                controller.clear();
              },
              child: const Icon(Icons.close),
            ),
          ),
          onListChanged: (value) {
            log('MultiSelectControllerDropdown onChanged value: $value');
          },
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              controller.clear();
            },
            child: const Text(
              'Clear',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (controller.value.contains(jobItems[0])) {
                controller.remove(jobItems[0]);
              } else {
                controller.add(jobItems[0]);
              }
            },
            child: const Text(
              'Toggle first item selection',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}

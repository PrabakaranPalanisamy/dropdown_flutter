import 'dart:developer';

import 'package:dropdown_flutter_fork/custom_dropdown.dart';
import 'package:dropdown_flutter_example/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecoratedDropdown extends StatelessWidget {
  const DecoratedDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownFlutter<JobType>.search(
      items: jobItems,
      initialItem: jobItems[2],
      hintText: 'Select job role',
      searchHintText: 'Search job role',
      excludeSelected: false,
      hideSelectedFieldWhenExpanded: true,
      closedHeaderPadding: const EdgeInsets.all(20),
      onChanged: (value) {
        log('DecoratedDropdown onChanged value: $value');
      },
      headerBuilder: (context, selectedItem, enabled) {
        return Text(
          selectedItem.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        );
      },
      listItemBuilder: (context, item, isSelected, onItemSelect) {
        return Text(
          item.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 16),
        );
      },
      noResultFoundBuilder: (context, text) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        );
      },
      decoration: CustomDropdownDecoration(
        closedFillColor: Colors.black,
        expandedFillColor: Colors.black,
        closedSuffixIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        ),
        expandedSuffixIcon: const Icon(
          Icons.keyboard_arrow_up,
          color: Colors.grey,
        ),
        closedShadow: [
          const BoxShadow(
            offset: Offset(0, 4),
            color: Colors.blue,
            blurRadius: 8,
          ),
        ],
        additionalOverlayOffset: Offset(0, 70),
        searchFieldDecoration: SearchFieldDecoration(
          fillColor: Colors.grey[700],
          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
          hintStyle: TextStyle(color: Colors.grey[400]),
          textStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          suffixIcon: (onClear) {
            return GestureDetector(
              onTap: onClear,
              child: Icon(Icons.close, color: Colors.grey[400]),
            );
          },
        ),
        listItemDecoration: ListItemDecoration(
          selectedColor: Colors.grey[900],
          highlightColor: Colors.grey[800],
        ),
      ),
    );
  }
}

class MultiSelectDecoratedDropdown extends StatelessWidget {
  const MultiSelectDecoratedDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownFlutter<JobType>.multiSelectSearch(
      items: jobItems,
      hintText: 'Select job role',
      searchHintText: 'Search job role',
      closedHeaderPadding: const EdgeInsets.all(20),
      onListChanged: (value) {
        log('MultiSelectDecoratedDropdown onChanged value: $value');
      },
      maxlines: 2,
      listItemBuilder: (context, item, isSelected, onItemSelect) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            CupertinoCheckbox(
              value: isSelected,
              onChanged: (_) => onItemSelect(),
            ),
          ],
        );
      },
      decoration: CustomDropdownDecoration(
        closedFillColor: Colors.black,
        expandedFillColor: Colors.black,
        hintStyle: TextStyle(
          color: Colors.blue[200],
          fontSize: 16,
        ),
        headerStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        noResultFoundStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 16,
        ),
        prefixIcon: const Icon(Icons.person, color: Colors.blue),
        closedSuffixIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.blue,
        ),
        expandedSuffixIcon: const Icon(
          Icons.keyboard_arrow_up,
          color: Colors.blue,
        ),
        closedShadow: [
          const BoxShadow(
            offset: Offset(0, 4),
            color: Colors.blue,
            blurRadius: 8,
          ),
        ],
        searchFieldDecoration: SearchFieldDecoration(
          fillColor: Colors.grey[700],
          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
          hintStyle: TextStyle(color: Colors.grey[400]),
          textStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          suffixIcon: (onClear) {
            return GestureDetector(
              onTap: onClear,
              child: Icon(Icons.close, color: Colors.grey[400]),
            );
          },
        ),
        listItemDecoration: ListItemDecoration(
          selectedColor: Colors.grey[900],
          highlightColor: Colors.grey[800],
        ),
      ),
    );
  }
}

class MultiSelectFilterDropdown extends StatelessWidget {
  const MultiSelectFilterDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      // width: 200,
      child: SizedBox(
        width: 240,
        height: 40,
        child: DropdownFlutter<JobType>.multiSelectSearch(
          items: biggerJobItems,
          hintText: 'Select job role',
          searchHintText: 'Search job role',
          // closedHeaderPadding: const EdgeInsets.all(20),
          onListChanged: (value) {
            log('MultiSelectDecoratedDropdown onChanged value: $value');
          },
          maxlines: 2,
          itemsListPadding: EdgeInsets.zero,
          overlayHeight: 300,
          hideSelectedFieldWhenExpanded: true,
          listItemBuilder: (context, item, isSelected, onItemSelect) {
            return SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.toString(),
                    style:
                        const TextStyle(color: Color(0xFF333638), fontSize: 14),
                  ),
                  CupertinoCheckbox(
                    value: isSelected,
                    onChanged: (_) => onItemSelect(),
                  ),
                ],
              ),
            );
          },

          decoration: CustomDropdownDecoration(
            overlayScrollbarDecoration: ScrollbarThemeData(
              thickness: WidgetStateProperty.all(8),
              radius: const Radius.circular(8),
              thumbColor: WidgetStateProperty.all(Color(0xFFE0E0E0)),
              trackColor: WidgetStateProperty.all(Color(0xFFF4F4F4)),
              thumbVisibility: biggerJobItems.length >= 5
                  ? WidgetStateProperty.all<bool>(true)
                  : WidgetStateProperty.all<bool>(false),
            ),
            closedFillColor: Colors.white,
            expandedFillColor: Colors.white,
            closedBorderRadius: BorderRadius.circular(4),
            expandedBorderRadius: BorderRadius.circular(4),
            hintStyle: TextStyle(
              color: Color(0xFF8D8D8D),
              fontSize: 14,
            ),
            headerStyle: const TextStyle(
              color: Color(0xFF393939),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            noResultFoundStyle: const TextStyle(
              color: Color(0xFF8D8D8D),
              fontSize: 14,
            ),
            // prefixIcon: const Icon(Icons.person, color: Colors.blue),
            closedSuffixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF393939),
              ),
            ),
            expandedSuffixIcon: SizedBox.shrink(),
            closedShadow: [
              BoxShadow(
                color: Color(0x33D5D7DE),
                blurRadius: 4,
                offset: Offset(0, 2),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x1ED5D7DE),
                blurRadius: 10,
                offset: Offset(0, 1),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x23D5D7DE),
                blurRadius: 5,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
            searchFieldDecoration: SearchFieldDecoration(
              fillColor: Colors.white,
              searchFieldOuterPadding: EdgeInsets.zero,
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFF64696D),
                size: 20,
              ),
              hintStyle: TextStyle(color: Color(0xFF8D8D8D)),
              textStyle:
                  const TextStyle(color: Color(0xFF6F6F6F), fontSize: 14),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding:
                  const EdgeInsets.only(top: 10, right: 16, left: 16),
              hoverColor: Colors.transparent,
              suffixIcon: (onClear) {
                return GestureDetector(
                  onTap: onClear,
                  child: SizedBox.shrink(),
                );
              },
            ),
            listItemDecoration: ListItemDecoration(
              // selectedColor: Colors.grey[900],
              selectedColor: Colors.transparent,
              highlightColor: Color(0xFFFCEEE7),
              splashColor: Color(0xFFFEF9F6),
              hoverColor: Color(0xFFFEF9F6),
            ),
          ),
          listItemPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          headerListBuilder: (context, selectedItems, enabled) {
            return Text(
              '${selectedItems.length} selected',
              style: const TextStyle(color: Colors.black, fontSize: 14),
            );
          },
        ),
      ),
    );
  }
}

class MultiSelectFilterCustomDropdown extends StatefulWidget {
  const MultiSelectFilterCustomDropdown({super.key});

  @override
  State<MultiSelectFilterCustomDropdown> createState() =>
      _MultiSelectFilterCustomDropdownState();
}

class _MultiSelectFilterCustomDropdownState
    extends State<MultiSelectFilterCustomDropdown> {
  late final MultiSelectController<JobType> multiSelectController;

  @override
  void initState() {
    multiSelectController = MultiSelectController([]);
    super.initState();
  }

  @override
  void dispose() {
    multiSelectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      // width: 200,
      child: SizedBox(
        width: 240,
        height: 40,
        child: DropdownFlutter<JobType>.multiSelectSearch(
          items: biggerJobItems,
          hintText: 'Select job role',
          searchHintText: 'Search job role',
          // closedHeaderPadding: const EdgeInsets.all(20),
          onListChanged: (value) {
          },
          onApplyButtonPressed: (value) {
            log('MultiSelectDecoratedDropdown onApplyButtonPressed value: $value');
          },
          applyButtonBuilder: (context, onApply) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: onApply,
                  child: Text("Apply"),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.deepOrange),
                  )),
            );
          },
          maxlines: 2,
          itemsListPadding: EdgeInsets.zero,
          overlayHeight: 300,
          overlayWidth: 150,
          hideSelectedFieldWhenExpanded: true,
          multiSelectController: multiSelectController,
          listItemBuilder: (context, item, isSelected, onItemSelect) {
            return SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.toString(),
                    style:
                        const TextStyle(color: Color(0xFF333638), fontSize: 14),
                  ),
                  CupertinoCheckbox(
                    value: isSelected,
                    onChanged: (_) => onItemSelect(),
                    activeColor: Colors.deepOrange,
                  ),
                ],
              ),
            );
          },

          decoration: CustomDropdownDecoration(
            showApplyButtonInMultipleSelect: true,
            showSelectAllInMultipleSelect: true,
            overlayScrollbarDecoration: ScrollbarThemeData(
              thickness: WidgetStateProperty.all(8),
              radius: const Radius.circular(8),
              thumbColor: WidgetStateProperty.all(Color(0xFFE0E0E0)),
              trackColor: WidgetStateProperty.all(Color(0xFFF4F4F4)),
              thumbVisibility: biggerJobItems.length >= 5
                  ? WidgetStateProperty.all<bool>(true)
                  : WidgetStateProperty.all<bool>(false),
            ),
            closedFillColor: Colors.white,
            expandedFillColor: Colors.white,
            closedBorderRadius: BorderRadius.circular(4),
            expandedBorderRadius: BorderRadius.circular(4),
            hintStyle: TextStyle(
              color: Color(0xFF8D8D8D),
              fontSize: 14,
            ),
            headerStyle: const TextStyle(
              color: Color(0xFF393939),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            noResultFoundStyle: const TextStyle(
              color: Color(0xFF8D8D8D),
              fontSize: 14,
            ),
            // prefixIcon: const Icon(Icons.person, color: Colors.blue),
            closedSuffixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF393939),
              ),
            ),
            expandedSuffixIcon: SizedBox.shrink(),
            closedShadow: [
              BoxShadow(
                color: Color(0x33D5D7DE),
                blurRadius: 4,
                offset: Offset(0, 2),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x1ED5D7DE),
                blurRadius: 10,
                offset: Offset(0, 1),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x23D5D7DE),
                blurRadius: 5,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
            searchFieldDecoration: SearchFieldDecoration(
              fillColor: Colors.white,
              searchFieldOuterPadding: EdgeInsets.zero,
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFF64696D),
                size: 20,
              ),
              hintStyle: TextStyle(color: Color(0xFF8D8D8D)),
              textStyle:
                  const TextStyle(color: Color(0xFF6F6F6F), fontSize: 14),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding:
                  const EdgeInsets.only(top: 10, right: 16, left: 16),
              hoverColor: Colors.transparent,
              suffixIcon: (onClear) {
                return GestureDetector(
                  onTap: onClear,
                  child: SizedBox.shrink(),
                );
              },
            ),
            listItemDecoration: ListItemDecoration(
              // selectedColor: Colors.grey[900],
              selectedIconColor: Colors.deepOrange,
              selectedColor: Colors.transparent,
              highlightColor: Color(0xFFFCEEE7),
              splashColor: Color(0xFFFEF9F6),
              hoverColor: Color(0xFFFEF9F6),
            ),
          ),
          listItemPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          headerListBuilder: (context, selectedItems, enabled) {
            return Text(
              '${selectedItems.length} selected',
              style: const TextStyle(color: Colors.black, fontSize: 14),
            );
          },
        ),
      ),
    );
  }
}

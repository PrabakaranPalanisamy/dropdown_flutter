part of '../../../custom_dropdown.dart';

class _ItemsList<T> extends StatelessWidget {
  final ScrollController scrollController;
  final T? selectedItem;
  final List<T> items, selectedItems;
  final Function(T) onItemSelect;
  final Function(bool?) onSelectAll;
  final bool excludeSelected;
  final bool? isSelectedAll;
  final EdgeInsets itemsListPadding, listItemPadding;
  final _ListItemBuilder<T> listItemBuilder;
  final ListItemDecoration? decoration;
  final _DropdownType dropdownType;
  final bool shouldShowSelectAll;
  final MultiSelectController<T> selectedItemsNotifier;
  final _SelectAllListItemBuilder<T> selectAllListItemBuilder;

  const _ItemsList({
    super.key,
    required this.scrollController,
    required this.selectedItem,
    required this.items,
    required this.onItemSelect,
    required this.onSelectAll,
    required this.isSelectedAll,
    required this.excludeSelected,
    required this.itemsListPadding,
    required this.listItemPadding,
    required this.listItemBuilder,
    required this.selectedItems,
    required this.decoration,
    required this.dropdownType,
    this.shouldShowSelectAll = false,
    required this.selectedItemsNotifier,
    required this.selectAllListItemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        shrinkWrap: true,
        children: [
          if (shouldShowSelectAll &&
              dropdownType == _DropdownType.multipleSelect) ...[
            selectAllListItemBuilder(
                context, isSelectedAll, (bool) => onSelectAll(bool))
          ],
          ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            padding: itemsListPadding,
            itemCount: items.length,
            itemBuilder: (_, index) {
              final selected = switch (dropdownType) {
                _DropdownType.singleSelect =>
                  !excludeSelected && selectedItem == items[index],
                _DropdownType.multipleSelect =>
                  selectedItems.contains(items[index])
              };
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  hoverColor: decoration?.hoverColor ??
                      ListItemDecoration._defaultHoverColor,
                  splashColor: decoration?.splashColor ??
                      ListItemDecoration._defaultSplashColor,
                  highlightColor: decoration?.highlightColor ??
                      ListItemDecoration._defaultHighlightColor,
                  onTap: () => onItemSelect(items[index]),
                  child: Ink(
                    color: selected
                        ? (decoration?.selectedColor ??
                            ListItemDecoration._defaultSelectedColor)
                        : Colors.transparent,
                    padding: listItemPadding,
                    child: listItemBuilder(
                      context,
                      items[index],
                      selected,
                      () => onItemSelect(items[index]),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

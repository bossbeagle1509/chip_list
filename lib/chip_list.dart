library chip_list;

import 'package:flutter/material.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

typedef OnToggle = void Function(int index);

/// Creates a list of [ChoiceChips] with
/// all logic handled.
///
///
/// Set the names of chips and boom !
/// Use [supportsMultiSelect] if
/// multiple chips can be selected at once.
class ChipList extends StatefulWidget {
  ChipList({
    Key? key,
    required this.listOfChipNames,
    required this.activeBgColor,
    required this.inactiveBgColor,
    required this.activeTextColor,
    required this.inactiveTextColor,
    required this.listOfChipIndicesCurrentlySeclected,
    this.supportsMultiSelect = false,
    this.style,
    this.extraOnToggle,
  }) : super(key: key);

  /// In case you chain some *more* logic to this widget's
  /// onTap event (maybe trigger updation of other UI components).
  /// If this is used, ensure you call
  /// setState at the end of the function.
  final OnToggle? extraOnToggle;

  /// List of ChoiceChip names in order of building them.
  final List listOfChipNames;

  /// If multiple [ChoiceChips] can be selected at once.
  /// Defaults to [false].
  final bool supportsMultiSelect;

  /// The background color of an inactive [ChoiceChip]
  final Color inactiveBgColor;

  /// The background color of an active [ChoiceChip]
  final Color activeBgColor;

  /// The text color of an active [ChoiceChip]
  final Color activeTextColor;

  /// The text color of an inactive [ChoiceChip]
  final Color inactiveTextColor;

  /// Initial `index` that must be selected.
  /// Use this to sync this widget with
  /// others if need be.
  List<int> listOfChipIndicesCurrentlySeclected;

  /// For any styling needs.
  /// Using [color] here is pointless
  /// as it will be overwritten by [activeTextColor]
  /// and [inactiveTextColor].
  final TextStyle? style;

  @override
  _ChipListState createState() => _ChipListState();
}

class _ChipListState extends State<ChipList> {
  bool _checkChipSelectionStatus(int _index) {
    if (widget.supportsMultiSelect &&
        widget.listOfChipIndicesCurrentlySeclected.contains(_index)) {
      return true;
    } else if (!widget.supportsMultiSelect &&
        widget.listOfChipIndicesCurrentlySeclected.first == _index) {
      return true;
    }

    return false;
  }

  void _handleOnSelected(int _index) {
    // if [supportsMultiSelect] is true
    if (widget.supportsMultiSelect) {
      if (widget.listOfChipIndicesCurrentlySeclected.contains(_index)) {
        widget.listOfChipIndicesCurrentlySeclected.remove(_index);
        return;
      } else {
        widget.listOfChipIndicesCurrentlySeclected.add(_index);
        return;
      }
    }

    // otherwise logic for ensuring only one
    // chip is selected.
    else {
      widget.listOfChipIndicesCurrentlySeclected.first = _index;
    }
  }

  Color _textColorizer(int _index) {
    // if [supportsMultiSelect] is true
    if (widget.supportsMultiSelect) {
      if (widget.listOfChipIndicesCurrentlySeclected.contains(_index)) {
        return widget.activeTextColor;
      } else {
        return widget.inactiveTextColor;
      }
    }

    // otherwise logic for ensuring only one
    // chip is selected.
    else {
      if (_index == widget.listOfChipIndicesCurrentlySeclected.first) {
        return widget.activeTextColor;
      } else {
        return widget.inactiveTextColor;
      }
    }
  }

  Color _tileColorizer(int _index) {
    // if [supportsMultiSelect] is true
    if (widget.supportsMultiSelect) {
      if (widget.listOfChipIndicesCurrentlySeclected.contains(_index)) {
        return widget.activeBgColor;
      } else {
        return widget.inactiveBgColor;
      }
    }

    // otherwise logic for ensuring only one
    // chip is selected.
    else {
      if (_index == widget.listOfChipIndicesCurrentlySeclected.first) {
        return widget.activeBgColor;
      } else {
        return widget.inactiveBgColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.listOfChipNames.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Text(
                widget.listOfChipNames[index],
                style: widget.style != null
                    ? widget.style!.copyWith(
                        color: _textColorizer(index),
                      )
                    : const TextStyle().copyWith(
                        color: _textColorizer(index),
                      ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Theme.of(context).primaryColor),
              ),
              backgroundColor: _tileColorizer(index),
              selected: _checkChipSelectionStatus(index),
              selectedColor: Theme.of(context).primaryColor,
              onSelected: (val) {
                // update other chips depending on value of [supportsMultiSelect]
                _handleOnSelected(index);

                if (widget.extraOnToggle != null) {
                  widget.extraOnToggle!(index);

                  // prevents further execution,
                  // thus ensuring setState is not called.
                  return;
                }

                // update UI
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}

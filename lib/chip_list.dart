library chip_list;

import 'package:flutter/material.dart';

typedef OnToggle = void Function(int index);

/// Creates a list of [ChoiceChips] with
/// all logic handled.
///
///
/// Set the names of chips and boom !
/// Use [supportsMultiSelect] if
/// multiple chips can be selected at once.
class ChipList extends StatefulWidget {
  const ChipList({
    Key? key,
    required this.listOfChipNames,
    required this.activeBgColor,
    required this.inactiveBgColor,
    required this.activeTextColor,
    required this.inactiveTextColor,
    required this.listOfChipIndicesCurrentlySeclected,
    this.style,
    this.borderColorList = const [Colors.white],
    this.borderRadiiList = const [15],
    this.supportsMultiSelect = false,
    this.extraOnToggle,
    this.shouldWrap = false,
    this.scrollPhysics,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapCrossAlignment = WrapCrossAlignment.start,
    this.axis = Axis.horizontal,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.spacing = 0.0,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);

  /// In case you chain some *more* logic to this widget's
  /// onTap event (maybe trigger updation of other UI components).
  /// If this is used, ensure you call
  /// setState at the end of the function.
  final OnToggle? extraOnToggle;

  /// List of ChoiceChip names in order of building them.
  final List<String> listOfChipNames;

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
  /// Useful to sync this widget with
  /// others if need be.
  final List<int> listOfChipIndicesCurrentlySeclected;

  /// For any styling needs.
  /// Using [color] here is pointless
  /// as it will be overwritten by [activeTextColor]
  /// and [inactiveTextColor].
  final TextStyle? style;

  /// Determines if the chip_list should be wrapped.
  /// If you set it to [true],
  /// ensure that you wrap the [ChipList]
  /// within a [SizedBox] and define the [width]
  /// property.
  ///
  /// Defaults to false.
  final bool shouldWrap;

  /// If you wish to change the [ScrollPhysics]
  /// of the widget.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? scrollPhysics;

  /// MainAxisAlignment for the parent [Row] of
  /// the [ChipList].
  ///
  /// Defaults to [MainAxisAlignment.center]
  final MainAxisAlignment mainAxisAlignment;

  /// [WrapAlignment] used, if [shouldWrap] is [true]
  ///
  /// Defaults to [WrapAlignment.start].
  final WrapAlignment wrapAlignment;

  /// [WrapCrossAlignment] used, if [shouldWrap] is [true]
  ///
  /// Defaults to [WrapCrossAlignment.start].
  final WrapCrossAlignment wrapCrossAlignment;

  /// [Axis] used, if [shouldWrap] is [true]
  ///
  /// Defaults to [Axis.horizontal
  final Axis axis;

  /// [WrapAlignment] used, if [shouldWrap] is [true],
  ///
  /// How the runs themselves should
  ///  be placed in the cross axis.
  ///
  /// Defaults to [WrapAlignment.start].
  final WrapAlignment runAlignment;

  /// [runSpacing] used, if [shouldWrap] is [true],
  ///
  /// How much space to place between the
  /// runs themselves in the cross axis.
  ///
  /// Defaults to 0.0.
  final double runSpacing;

  /// [spacing] used, if [shouldWrap] is [true],
  ///
  /// How much space to place between
  /// children in a run in the main axis.
  ///
  /// Defaults to 0.0.
  final double spacing;

  /// [textDirection] used, if [shouldWrap] is [true],
  ///
  /// Determines the order to lay children out
  /// horizontally and how to interpret start
  /// and end in the horizontal direction.
  final TextDirection? textDirection;

  /// [verticalDirection] used, if [shouldWrap] is [true],
  ///
  /// Determines the order to lay children out
  /// vertically and how to interpret start and
  /// end in the vertical direction.
  ///
  /// Defaults to [VerticalDirection.down].
  final VerticalDirection verticalDirection;

  /// If you want to customize the
  /// border radii of each [ChoiceChip], then set
  /// the radius of each [ChoiceChip] here in order.
  ///
  /// If you want to use a single radius
  /// for all chips, then set only one radius here.
  ///
  /// Deafults to 15.0.
  final List<double> borderRadiiList;

  // If you want to customize the
  /// border color of each [ChoiceChip], then set
  /// the color of each [ChoiceChip] here in order.
  ///
  /// If you want to use a single color
  /// for all chips, then set only one color here.
  ///
  /// Deafults to [Colors.white].
  final List<Color> borderColorList;

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
  void initState() {
    super.initState();

    if (widget.borderColorList.length != 1 &&
        widget.borderColorList.length != widget.listOfChipNames.length) {
      throw 'Length of borderColorList must match the length of listOfChipNames, if overriden.';
    }

    if (widget.borderRadiiList.length != 1 &&
        widget.borderRadiiList.length != widget.listOfChipNames.length) {
      throw 'Length of borderRadiiList must match the length of listOfChipNames, if overriden.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.shouldWrap
        ? Wrap(
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
                    borderRadius: BorderRadius.circular(
                      widget.borderRadiiList.length == 1
                          ? widget.borderRadiiList.first
                          : widget.borderRadiiList[index],
                    ),
                    side: BorderSide(
                      color: widget.borderColorList.length == 1
                          ? widget.borderColorList.first
                          : widget.borderColorList[index],
                    ),
                  ),
                  backgroundColor: widget.inactiveBgColor,
                  selected: _checkChipSelectionStatus(index),
                  selectedColor: _tileColorizer(index),
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
            alignment: widget.wrapAlignment,
            crossAxisAlignment: widget.wrapCrossAlignment,
            direction: widget.axis,
            runAlignment: widget.runAlignment,
            runSpacing: widget.runSpacing,
            spacing: widget.spacing,
            textDirection: widget.textDirection,
            verticalDirection: widget.verticalDirection,
          )
        : SingleChildScrollView(
            physics: widget.scrollPhysics ?? const ScrollPhysics(),
            child: Row(
              mainAxisAlignment: widget.mainAxisAlignment,
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
                      borderRadius: BorderRadius.circular(
                          widget.borderRadiiList.length == 1
                              ? widget.borderRadiiList.first
                              : widget.borderRadiiList[index]),
                      side: BorderSide(
                        color: widget.borderColorList.length == 1
                            ? widget.borderColorList.first
                            : widget.borderColorList[index],
                      ),
                    ),
                    backgroundColor: widget.inactiveBgColor,
                    selected: _checkChipSelectionStatus(index),
                    selectedColor: _tileColorizer(index),
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

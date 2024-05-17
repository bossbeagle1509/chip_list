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
// ignore: must_be_immutable
class ChipList extends StatefulWidget {
ChipList(
      {Key? key,
      required this.listOfChipNames,
      required this.listOfChipIndicesCurrentlySelected,
      this.activeTextColorList = const [Colors.white],
      this.inactiveTextColorList = const [Colors.blue],
      this.activeBgColorList = const [Colors.blue],
      this.inactiveBgColorList = const [Colors.white],
      this.style,
      this.inactiveBorderColorList = const [Colors.white],
      this.activeBorderColorList = const [Colors.white],
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
      this.padding = EdgeInsets.zero,
      this.widgetSpacing = 4,
      this.checkmarkColor,
      this.showCheckmark = true,
      this.elevation = 0,
      this.tooltips = const [""],
      this.shadowColor = const [Colors.transparent],
      this.selectedShadowColor = const [Colors.black]})
      : super(key: key);

  /// In case you chain some *more* logic to this widget's
  /// onTap event (maybe trigger updation of other UI components).
  /// If this is used, ensure you call
  /// [setState] at the end of the function.
  OnToggle? extraOnToggle;

  /// List of ChoiceChip names in order of building them.
  List<String> listOfChipNames;

  /// If multiple [ChoiceChips] can be selected at once.
  ///
  /// Defaults to [false].
  bool supportsMultiSelect;

  /// The background color of an inactive [ChoiceChip].
  ///
  // If you want to customize the inactive
  /// background color of each [ChoiceChip], then set
  /// the color of each one here in order.
  ///
  /// If you want to use a single color
  /// for all chips, then set only one color here.
  ///
  /// Defults to [Colors.white].
  List<Color> inactiveBgColorList;

  /// The background color of an active [ChoiceChip].
  ///
  // If you want to customize the
  /// active background color of each [ChoiceChip], then set
  /// the color of each one here in order.
  ///
  /// If you want to use a single color
  /// for all chips, then set only one color here.
  ///
  /// Defults to [Colors.blue].
  List<Color> activeBgColorList;

  /// The text color of an active [ChoiceChip].
  ///
  /// // If you want to customize the
  /// active text color of each [ChoiceChip], then set
  /// the color of each one here in order.
  ///
  /// If you want to use a single color
  /// for all chips, then set only one color here.
  ///
  /// Defults to [Colors.white].
  List<Color> activeTextColorList;

  /// The text color of an inactive [ChoiceChip].
  ///
  /// If you want to customize the
  /// inactive text color of each [ChoiceChip], then set
  /// the color of each one here in order.
  ///
  /// If you want to use a single color
  /// for all chips, then set only one color here.
  ///
  /// Defults to [Colors.blue].
  List<Color> inactiveTextColorList;

  /// Initial `index` that must be selected.
  /// Useful to sync this widget with
  /// others if need be.
  List<int> listOfChipIndicesCurrentlySelected;

  /// For any text styling needs.
  ///
  /// Using [color] here is pointless
  /// as it will be overwritten by
  /// the value of [activeTextColorList]
  /// and [inactiveTextColorList].
  TextStyle? style;

  /// Determines if the chip_list should be wrapped.
  ///
  /// If you set it to [true],
  /// ensure that you wrap the [ChipList]
  /// within a [SizedBox] and define the [width]
  /// property.
  ///
  /// Defaults to false.
  bool shouldWrap;

  /// If you wish to change the [ScrollPhysics]
  /// of the widget.
  ///
  /// Defaults to matching platform conventions.
  ScrollPhysics? scrollPhysics;

  /// MainAxisAlignment for the parent [Row] or [Column] of
  /// the [ChipList], which is used in case of
  /// [Axis.horizontal] or [Axis.vertical] being passed in
  /// to [axis].
  ///
  /// Defaults to [MainAxisAlignment.center]
  MainAxisAlignment mainAxisAlignment;

  /// [WrapAlignment] used, if [shouldWrap] is [true].
  ///
  /// Defaults to [WrapAlignment.start].
  WrapAlignment wrapAlignment;

  /// [WrapCrossAlignment] used, if [shouldWrap] is [true]
  ///
  /// Defaults to [WrapCrossAlignment.start].
  WrapCrossAlignment wrapCrossAlignment;

  /// [Axis] used, if [shouldWrap] is [true].
  ///
  /// Defaults to [Axis.horizontal].
  Axis axis;

  /// [WrapAlignment] used, if [shouldWrap] is [true].
  ///
  /// How the runs themselves should
  /// be placed in the cross axis.
  ///
  /// Defaults to [WrapAlignment.start].
  WrapAlignment runAlignment;

  /// [runSpacing] used, if [shouldWrap] is [true],
  ///
  /// How much space to place between the
  /// runs themselves in the cross axis.
  ///
  /// Defaults to 0.0.
  double runSpacing;

  /// [spacing] used, if [shouldWrap] is [true],
  ///
  /// How much space to place between
  /// children in a run in the main axis.
  ///
  /// Defaults to 0.0.
  double spacing;

  /// [textDirection] used, if [shouldWrap] is [true],
  ///
  /// Determines the order to lay children out
  /// horizontally and how to interpret start
  /// and end in the horizontal direction.
  TextDirection? textDirection;

  /// [verticalDirection] used, if [shouldWrap] is [true],
  ///
  /// Determines the order to lay children out
  /// vertically and how to interpret start and
  /// end in the vertical direction.
  ///
  /// Defaults to [VerticalDirection.down].
  VerticalDirection verticalDirection;

  /// If you want to customize the
  /// border radii of each [ChoiceChip], then set
  /// the radius of each [ChoiceChip] here in order.
  ///
  /// If you want to use a single radius
  /// for all chips, then set only one radius here.
  ///
  /// Deafults to 15.0.
  List<double> borderRadiiList;

  /// If you want to customize the
  /// border color of each inactive [ChoiceChip], then set
  /// the color of each here, in order.
  ///
  /// If you want to use a single color
  /// for all chips, whilst they're inactive,
  /// then set only one color here.
  ///
  /// Defaults to [Colors.white].
  List<Color> inactiveBorderColorList;

  /// If you want to customize the
  /// border color of each active [ChoiceChip], then set
  /// the color of each here, in order.
  ///
  /// If you want to use a single color
  /// for all chips, whilst they're active,
  /// then set only one color here.
  ///
  /// Defaults to [Colors.white].
  List<Color> activeBorderColorList;

  /// Use this to alter the padding of
  /// widgets in the list of the list,
  ///
  /// If [axis] is set to horizontal, then
  /// this will be the horizontal padding,
  /// and vice versa.
  ///
  /// Defaults to 4.0.
  double widgetSpacing;

  /// Sets the inner spacing for the child of each [ChoiceChip].
  /// Defaults to [EdgeInsets.zero].
  EdgeInsets padding;

  /// Sets color for checkmark if enabled
  /// Defaults to null, which triggers Flutter to use the appropriate color
  /// based off of the Brightness setting. If you're not sure, leave this blank
  Color? checkmarkColor;

  /// Sets if the checkMark is enabled
  /// Defaults to [true]
  bool showCheckmark;

  /// Sets the elevation for all [ChoiceChip]s
  /// Defaults to 0
  double elevation;

  /// If you want to customize the
  /// tooltip text of each [ChoiceChip], then set
  /// the text for each one here, in order.
  ///
  /// If you want to use a single tooltip text
  /// for all chips, whilst they're active,
  /// then set only one string here.
  ///
  /// Defaults to [""].
  List<String> tooltips;

  /// If you want to customize the
  /// shadow color of each inactive [ChoiceChip], then set
  /// the color of each here, in order.
  ///
  /// If you want to use a single color
  /// for all chips, whilst they're inactive,
  /// then set only one color here.
  ///
  /// Defaults to [Colors.transparent].
  List<Color> shadowColor;

  /// If you want to customize the
  /// border color of each active [ChoiceChip], then set
  /// the color of each here, in order.
  ///
  /// If you want to use a single color
  /// for all chips, whilst they're active,
  /// then set only one color here.
  ///
  /// Defaults to [Colors.black].
  List<Color> selectedShadowColor;

  @override
  State<ChipList> createState() => _ChipListState();
}

class _ChipListState extends State<ChipList> {
  bool _checkChipSelectionStatus(int index) {
    if (widget.supportsMultiSelect &&
        widget.listOfChipIndicesCurrentlySelected.contains(index)) {
      return true;
    } else if (!widget.supportsMultiSelect &&
        widget.listOfChipIndicesCurrentlySelected.isNotEmpty &&
        widget.listOfChipIndicesCurrentlySelected.first == index) {
      return true;
    }

    return false;
  }

  void _handleOnSelected(int index) {
    // if [supportsMultiSelect] is true
    if (widget.supportsMultiSelect) {
      if (widget.listOfChipIndicesCurrentlySelected.contains(index)) {
        widget.listOfChipIndicesCurrentlySelected.remove(index);
      } else {
        widget.listOfChipIndicesCurrentlySelected.add(index);
      }
    }

    // otherwise logic for ensuring only one
    // chip is selected.
    else {
      // check if this should be a deselection first

      if (widget.listOfChipIndicesCurrentlySelected.contains(index)) {
        widget.listOfChipIndicesCurrentlySelected.removeLast();
      } else {
        if (widget.listOfChipIndicesCurrentlySelected.isEmpty) {
          widget.listOfChipIndicesCurrentlySelected.add(index);
        } else {
          widget.listOfChipIndicesCurrentlySelected.first = index;
        }
      }
    }
  }

  Color _textColorizer(int index) {
    assert(
        widget.activeTextColorList.length == widget.listOfChipNames.length ||
            widget.activeTextColorList.length == 1,
        "You can either supply one element to [activeTextColorList], or exactly as many as you have chips.");

    assert(
        widget.inactiveTextColorList.length == widget.listOfChipNames.length ||
            widget.inactiveTextColorList.length == 1,
        "You can either supply one element to [inactiveTextColorList], or exactly as many as you have chips.");

    // if [supportsMultiSelect] is true
    if (widget.supportsMultiSelect) {
      if (widget.listOfChipIndicesCurrentlySelected.contains(index)) {
        if (widget.activeTextColorList.length == 1) {
          return widget.activeTextColorList.first;
        } else {
          return widget.activeTextColorList[index];
        }
      } else {
        if (widget.inactiveTextColorList.length == 1) {
          return widget.inactiveTextColorList.first;
        } else {
          return widget.inactiveTextColorList[index];
        }
      }
    }

    // otherwise logic for ensuring only one
    // chip is selected.
    else {
      if (widget.listOfChipIndicesCurrentlySelected.isNotEmpty &&
          index == widget.listOfChipIndicesCurrentlySelected.first) {
        if (widget.activeTextColorList.length == 1) {
          return widget.activeTextColorList.first;
        } else {
          return widget.activeTextColorList[index];
        }
      } else {
        if (widget.inactiveTextColorList.length == 1) {
          return widget.inactiveTextColorList.first;
        } else {
          return widget.inactiveTextColorList[index];
        }
      }
    }
  }

  Color _tileColorizer(int index) {
    assert(
        widget.activeBgColorList.length == widget.listOfChipNames.length ||
            widget.activeBgColorList.length == 1,
        "You can either supply one element to [activeBackgroundColor], or exactly as many as you have chips.");

    assert(
        widget.inactiveBgColorList.length == widget.listOfChipNames.length ||
            widget.inactiveBgColorList.length == 1,
        "You can either supply one element to [inactiveBgColorList], or exactly as many as you have chips.");

    // if [supportsMultiSelect] is true
    if (widget.supportsMultiSelect) {
      if (widget.listOfChipIndicesCurrentlySelected.contains(index)) {
        if (widget.activeBgColorList.length == 1) {
          return widget.activeBgColorList.first;
        } else {
          return widget.activeBgColorList[index];
        }
      } else {
        if (widget.inactiveBgColorList.length == 1) {
          return widget.inactiveBgColorList.first;
        } else {
          return widget.inactiveBgColorList[index];
        }
      }
    }

    // otherwise logic for ensuring only one
    // chip is selected.
    else {
      if (widget.listOfChipIndicesCurrentlySelected.isNotEmpty &&
          index == widget.listOfChipIndicesCurrentlySelected.first) {
        if (widget.activeBgColorList.length == 1) {
          return widget.activeBgColorList.first;
        } else {
          return widget.activeBgColorList[index];
        }
      } else {
        if (widget.inactiveBgColorList.length == 1) {
          return widget.inactiveBgColorList.first;
        } else {
          return widget.inactiveBgColorList[index];
        }
      }
    }
  }

  Color _borderColorizer(int index) {
    assert(
        widget.activeBorderColorList.length == widget.listOfChipNames.length ||
            widget.activeBorderColorList.length == 1,
        "You can either supply one element to [activeBorderColor], or exactly as many as you have chips.");

    assert(
        widget.inactiveBorderColorList.length ==
                widget.listOfChipNames.length ||
            widget.inactiveBorderColorList.length == 1,
        "You can either supply one element to [inActiveBorderColor], or exactly as many as you have chips.");

    // if [supportsMultiSelect] is true
    if (widget.supportsMultiSelect) {
      if (widget.listOfChipIndicesCurrentlySelected.contains(index)) {
        if (widget.activeBorderColorList.length == 1) {
          return widget.activeBorderColorList.first;
        } else {
          return widget.activeBorderColorList[index];
        }
      } else {
        if (widget.inactiveBorderColorList.length == 1) {
          return widget.inactiveBorderColorList.first;
        } else {
          return widget.inactiveBorderColorList[index];
        }
      }
    }

    // otherwise logic for ensuring only one
    // chip is selected.
    else {
      if (widget.listOfChipIndicesCurrentlySelected.isNotEmpty &&
          index == widget.listOfChipIndicesCurrentlySelected.first) {
        if (widget.activeBorderColorList.length == 1) {
          return widget.activeBorderColorList.first;
        } else {
          return widget.activeBorderColorList[index];
        }
      } else {
        if (widget.inactiveBorderColorList.length == 1) {
          return widget.inactiveBorderColorList.first;
        } else {
          return widget.inactiveBorderColorList[index];
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    assert(
        widget.borderRadiiList.length == 1 ||
            widget.borderRadiiList.length == widget.listOfChipNames.length,
        'You can either supply one element to [borderRadiiList], or exactly as many as you have chips.');
  }

  String _getToolTipText(int index) {
    assert(
        widget.tooltips.length == widget.listOfChipNames.length ||
            widget.tooltips.length == 1,
        "You can either supply one element to [tooltips], or exactly as many as you have chips.");
    if (index >= widget.tooltips.length) {
      return widget.tooltips.first;
    }

    return widget.tooltips[index];
  }

  Color _getShadowColor(int index) {
    assert(
        widget.shadowColor.length == widget.listOfChipNames.length ||
            widget.shadowColor.length == 1,
        "You can either supply one [shadowColor], or exactly as many as you have chips.");
    if (index >= widget.shadowColor.length) {
      return widget.shadowColor.first;
    }

    return widget.shadowColor[index];
  }

  Color _getSelectedShadowColor(int index) {
    assert(
        widget.selectedShadowColor.length == widget.listOfChipNames.length ||
            widget.selectedShadowColor.length == 1,
        "You can either supply one [selectedShadowColor], or exactly as many as you have chips.");
    if (index >= widget.selectedShadowColor.length) {
      return widget.selectedShadowColor.first;
    }

    return widget.selectedShadowColor[index];
  }

  List<Widget> _children(bool isHorizontal) {
    return List.generate(
      widget.listOfChipNames.length,
      (index) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: isHorizontal ? 0 : widget.widgetSpacing,
          horizontal: isHorizontal ? widget.widgetSpacing : 0,
        ),
        child: ChoiceChip(
          elevation: widget.elevation,
          shadowColor: _getShadowColor(index),
          selectedShadowColor: _getSelectedShadowColor(index),
          tooltip: _getToolTipText(index),
          showCheckmark: widget.showCheckmark,
          checkmarkColor: widget.checkmarkColor,
          label: Padding(
            padding: widget.padding,
            child: Text(
              widget.listOfChipNames[index],
              style: widget.style != null
                  ? widget.style!.copyWith(
                      color: _textColorizer(index),
                    )
                  : const TextStyle().copyWith(
                      color: _textColorizer(index),
                    ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                widget.borderRadiiList.length == 1
                    ? widget.borderRadiiList.first
                    : widget.borderRadiiList[index]),
            side: BorderSide(
              color: _borderColorizer(index),
            ),
          ),
          backgroundColor: widget.inactiveBgColorList.length == 1
              ? widget.inactiveBgColorList.first
              : widget.inactiveBgColorList[index],
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.shouldWrap
        ? Wrap(
            alignment: widget.wrapAlignment,
            crossAxisAlignment: widget.wrapCrossAlignment,
            direction: widget.axis,
            runAlignment: widget.runAlignment,
            runSpacing: widget.runSpacing,
            spacing: widget.spacing,
            textDirection: widget.textDirection,
            verticalDirection: widget.verticalDirection,
            children: _children(true),
          )
        : SingleChildScrollView(
            scrollDirection: widget.axis,
            physics: widget.scrollPhysics ?? const ScrollPhysics(),
            child: widget.axis == Axis.horizontal
                ? Row(
                    mainAxisAlignment: widget.mainAxisAlignment,
                    children: _children(true),
                  )
                : Column(
                    mainAxisAlignment: widget.mainAxisAlignment,
                    children: _children(false),
                  ),
          );
  }
}

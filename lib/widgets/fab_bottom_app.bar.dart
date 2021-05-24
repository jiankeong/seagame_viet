import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../globals.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.icon, this.text});
  Widget? icon;
  Text? text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    required this.items,
    this.centerItemText,
    this.height: kBottomNavigationBarHeight,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
    this.notchMargin = 5,
  });

  final List<FABBottomAppBarItem> items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int>? onTabSelected;
  final double notchMargin;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  // int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected!(index);
    // setState(() {
    //   _selectedIndex = index;
    // });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      notchMargin: widget.notchMargin,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
//      elevation: 5,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: (Globals().getScreenHeight() < 600
                ? widget.height + 5
                : Globals().getScreenHeight() < 1000
                    ? widget.height
                    : widget.height + 10)
            .h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize.h),
            Padding(
              padding: EdgeInsets.only(
                  top: Globals().getScreenHeight() < 600
                      ? 13.h
                      : Globals().getScreenHeight() < 1000
                          ? 7.h
                          : 15.h),
              child: Text(
                widget.centerItemText ?? '',
                style: TextStyle(
                  color: widget.color,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem? item,
    int? index,
    ValueChanged<int>? onPressed,
  }) {
    // Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height.h,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed!(index!),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Icon(item.iconData, color: color, size: widget.iconSize),
                item!.icon!,
                item.text!
              ],
            ),
          ),
        ),
      ),
    );
  }
}

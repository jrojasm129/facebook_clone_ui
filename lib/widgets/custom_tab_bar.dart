import 'package:facebook_clone/config/palette.dart';
import 'package:flutter/material.dart';

enum IndicatorPosition{
  top,
  bottom
}

class CustomTabBar extends StatelessWidget {

  final List<IconData> icons;
  final int selectedIndex;
  final Function(int index) onTap;  
  final IndicatorPosition indicatorPosition; 

  const CustomTabBar({ Key? key, 
    required this.icons, 
    required this.selectedIndex, 
    required this.onTap,
    this.indicatorPosition = IndicatorPosition.top
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator:  BoxDecoration(
        border: Border(
          bottom: indicatorPosition == IndicatorPosition.bottom
           ? const BorderSide(width: 3, color: Palette.facebookBlue)
           : BorderSide.none,
          top: indicatorPosition == IndicatorPosition.top
            ? const BorderSide(width: 3, color: Palette.facebookBlue)
            : BorderSide.none
        )
      ),
      tabs: icons.asMap().map((i, e) => MapEntry(i, Tab(
        icon: Icon(e, color: selectedIndex == i ? Palette.facebookBlue : Colors.black45,),
      )))
      .values
      .toList(),
      onTap: onTap,
      
    );
  }
}
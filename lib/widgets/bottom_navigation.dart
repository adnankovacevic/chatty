import 'package:auto24/widgets/navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemChanged,
  });

  final Function(int) onItemChanged;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationBarItem(
                icon: CupertinoIcons.bubble_left_bubble_right_fill,
                lable: 'Messages',
                isSelected: selectedIndex == 0,
                onPressed: () => onItemChanged(0),
              ),
              NavigationBarItem(
                icon: CupertinoIcons.at_circle_fill,
                lable: 'Mentions',
                isSelected: selectedIndex == 1,
                onPressed: () => onItemChanged(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

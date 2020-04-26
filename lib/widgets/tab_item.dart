import 'package:flutter/material.dart';

class TabItem extends StatefulWidget {
  final String name;
  final IconData icon;
  final int index;
  final int activeTab;
  final Function onTabChange;

  TabItem({
    @required this.name,
    @required this.icon,
    @required this.index,
    @required this.activeTab,
    @required this.onTabChange,
  });

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  get isActive {
    return widget.activeTab == widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTabChange(widget.index),
      child: Row(
        children: <Widget>[
          Icon(widget.icon,
              color: isActive ? Colors.white : Colors.white.withOpacity(0.6)),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
            width: isActive ? 80 : 0,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: isActive
                ? Text(
                    widget.name,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                      color: isActive
                          ? Colors.white
                          : Colors.white.withOpacity(0.6),
                      fontSize: 17,
                    ),
                  )
                : Text(''),
          )
        ],
      ),
    );
  }
}

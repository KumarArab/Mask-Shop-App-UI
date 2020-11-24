import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 12),
        MyTab(text: 'All', isSelected: false),
        MyTab(text: 'Masks', isSelected: true),
        MyTab(text: 'Socks', isSelected: false),
        MyTab(text: 'Hats', isSelected: false),
        MyTab(text: 'Gloves', isSelected: false),
      ],
    );
  }
}

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const MyTab({Key key, @required this.isSelected, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: isSelected ? 18 : 16,
              color: isSelected ? Color(0xFFD26C6E) : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? Color(0xFFD26C6E) : Colors.white,
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}

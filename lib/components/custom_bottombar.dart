import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
} 

class _CustomBottomBarState extends State<CustomBottomBar> {
  static var _context;
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return 
    Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          buildNavBarItem(Icons.cake, 0),
          buildNavBarItem(Icons.favorite, 1),
          buildNavBarItem(Icons.adjust, 2)
        ],
      )
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
      return GestureDetector(
        onTap: () { setState(() => _selectedItemIndex = index); },
        child: Container(
          height: 56,
          width: MediaQuery.of(_context).size.width / 3,
          decoration: index == _selectedItemIndex ? 
            BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 4, color: Colors.orange)
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.orange.withOpacity(0.3),
                  Colors.orange.withOpacity(0.015)
                ],
                begin: Alignment.bottomCenter, 
                end: Alignment.topCenter
              ),
            ) 
            : BoxDecoration(),
          child: Icon(
            icon,
            color: index == _selectedItemIndex ? Colors.orange : Colors.grey
          ),
        )
      );
  }

}
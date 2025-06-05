import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CupertinoStyleDropdown extends StatefulWidget {
  final List<String> items;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const CupertinoStyleDropdown({
    Key? key,
    required this.items,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _CupertinoStyleDropdownState createState() => _CupertinoStyleDropdownState();
}

class _CupertinoStyleDropdownState extends State<CupertinoStyleDropdown> {
  String? _selectedValue;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Кнопка для открытия меню
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xFFF2F2F7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _selectedValue ?? '',
                  style: TextStyle(
                    color: Color(0xFF3C3C43).withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 4),
                SvgPicture.string('''
                  <svg width="12" height="8" viewBox="0 0 12 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1 1.5L6 6.5L11 1.5" stroke="#8E8E93" stroke-width="1.5" stroke-linecap="round"/>
                  </svg>
                '''),
              ],
            ),
          ),
        ),
        
        // Выпадающий список
        if (_isExpanded) ...[
          SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: widget.items.map((item) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedValue = item;
                      _isExpanded = false;
                    });
                    widget.onChanged?.call(item);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFF2F2F7),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item,
                            style: TextStyle(
                              color: Color(0xFF3C3C43),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        if (_selectedValue == item)
                          Icon(
                            Icons.check,
                            size: 20,
                            color: Color(0xFF007AFF),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ],
    );
  }
}
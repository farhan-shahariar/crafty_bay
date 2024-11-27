import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker(
      {super.key, required this.color, required this.onColorSelected});

  final List<String> color;
  final Function(String) onColorSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late String _selectedSize = widget.color.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 8,
          children: widget.color.map((item) {
            return GestureDetector(
              onTap: () {
                _selectedSize = item;
                widget.onColorSelected(item);
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: _selectedSize == item ? AppColors.themeColor : null,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 20,
                    color: _selectedSize == item ? Colors.white : null,
                  ),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

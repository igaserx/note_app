import 'package:flutter/material.dart';
import 'package:note_app/core/constant.dart';

class ColorPicker extends StatefulWidget {
  final Color? selectedColor;
  final ValueChanged<Color> onColorSelected;
  const ColorPicker({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late Color? _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 2,
        child: GridView.builder(
          itemCount: kColors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            final color = kColors[index];
            final isSelected = _selectedColor == color;
            return InkWell(
              onTap: () {
                setState(() {
                  _selectedColor = color;
                });
                widget.onColorSelected(color);
              },
              child: Container(
                height: 32,
                width: 32,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                child:
                    isSelected
                        ? const Icon(Icons.done, color: Colors.white, size: 20)
                        : null,
              ),
            );
          },
        ),
      ),
    );
  }
}

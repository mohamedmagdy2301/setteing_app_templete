import 'package:flutter/material.dart';

class BuildCircleColorWidget extends StatelessWidget {
  const BuildCircleColorWidget({
    super.key,
    required this.onTap,
    required this.color,
    required this.isSelected,
  });

  final void Function()? onTap;
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: color, width: 3) : null,
        ),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}

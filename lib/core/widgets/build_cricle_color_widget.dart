import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theming_app_templete/core/themes/list_colors.dart';
import 'package:theming_app_templete/cubit/settings_cubit.dart';

class BuildCircleColorWidget extends StatelessWidget {
  const BuildCircleColorWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();
    final state = context.watch<SettingsCubit>().state;
    return GestureDetector(
      onTap: () => cubit.setColors(ColorsState.values[index]),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: state.colors == ColorsState.values[index]
              ? Border.all(color: color[index], width: 3)
              : null,
        ),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color[index],
          ),
        ),
      ),
    );
  }
}

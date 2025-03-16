
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproduct/app_theme.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';

class My_Chip extends StatelessWidget {
  const My_Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Chip(
          backgroundColor: state.selected.primary_1.withOpacity(0.1),
          side: BorderSide(color: state.selected.primary_1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          labelPadding: const EdgeInsets.only(left: 8.0, right: 5),
          label: Text(
            label,
            style: AppTheme.bodyMedium.copyWith(fontSize: 13),
          ),
          deleteIcon: Container(
            // margin: EdgeInsets.only(left: 2),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: state.selected.primary_5),
            child: Icon(Icons.close,
                size: 12,
                color: state.selected.white //Color.fromARGB(255, 255, 42, 42),
                ),
          ),
          onDeleted: () {
            onDeleted(index);
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproduct/app_theme.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';

Future<bool> showConfirmationDialog(
  BuildContext context,
  String label,
  String text,
  String doneLabel,
  String cancelLabel, {
  Widget? icon,
  bool? isdelete,
}) async {
  final state = context.read<ThemeSwitchBloc>().state;
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: state.selected.white,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: state.selected.white,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon ?? SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: state.selected.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22.0,
                  vertical: 0,
                ),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTheme.bodyLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state.selected.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        cancelLabel,
                        style: AppTheme.bodyLarge.copyWith(
                            color: (isdelete ?? false)
                                ? state.selected.black
                                : state.selected.danger),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (isdelete ?? false)
                            ? state.selected.danger
                            : state.selected.primary_1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        doneLabel,
                        style: AppTheme.bodyLarge
                            .copyWith(color: state.selected.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  ).then((val) => val ?? false);
}

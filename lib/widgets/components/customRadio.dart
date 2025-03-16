import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';

class CustomRadio extends StatefulWidget {
  final String value;
  final String groupValue;
  final void Function(String) onChanged;
  const CustomRadio(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return InkWell(
            splashColor: Colors.transparent,
            onTap: () => widget.onChanged(widget.value),
            child: Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: state.selected.primary_1),
              child: Container(
                margin: const EdgeInsets.all(0.1),
                padding: const EdgeInsets.all(0.1),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: state.selected.white),
                child: Container(
                  padding: const EdgeInsets.all(0.1),
                  child: Icon(
                    Icons.circle,
                    size: 15,
                    color: selected
                        ? state.selected.primary_1
                        : state.selected.white,
                  ),
                ),
              ),
            ));
      },
    );
  }
}

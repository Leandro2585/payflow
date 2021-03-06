import 'package:flutter/material.dart';
import 'package:payflow/ui/styles/index.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback handle;
  final TextStyle? style;

  const LabelButton({
    Key? key,
    required this.label,
    required this.handle,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
        onPressed: handle,
        child: Text(label, style: style ?? TextStyles.buttonHeading),
      ),
    );
  }
}

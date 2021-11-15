import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/app/themes/index.dart';

class LabelButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const LabelButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyles.buttonHeading,
        ),
      ),
    );
  }
}

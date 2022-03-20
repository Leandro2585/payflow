import 'package:flutter/material.dart';
import 'package:payflow/ui/styles/app_colors.dart';
import 'package:payflow/ui/styles/app_text_styles.dart';
import 'package:payflow/ui/widgets/index.dart';

class SeveralLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryHandle;
  final String secondaryLabel;
  final VoidCallback secondaryHandle;
  final bool enablePrimaryColor;

  const SeveralLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryHandle,
    required this.secondaryLabel,
    required this.secondaryHandle,
    this.enablePrimaryColor = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              handle: primaryHandle,
              style: enablePrimaryColor ? TextStyles.buttonPrimary : null,
            ),
          ),
          const DividerVertical(),
          Expanded(
            child: LabelButton(
              label: secondaryLabel,
              handle: secondaryHandle,
            ),
          ),
        ],
      ),
    );
  }
}

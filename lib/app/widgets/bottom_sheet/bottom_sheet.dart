import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payflow/app/themes/app_colors.dart';
import 'package:payflow/app/themes/index.dart';
import 'package:payflow/app/widgets/index.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subtitle;
  const BottomSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.shape,
        child: Column(
          children: [
            Expanded(child: Container(color: Colors.black.withOpacity(0.6))),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Text.rich(
                    TextSpan(
                      text: title,
                      style: TextStyles.buttonBoldHeading,
                      children: [
                        TextSpan(
                          text: '\n$subtitle',
                          style: TextStyles.buttonHeading,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(height: 1, color: AppColors.stroke),
                SetLabelButtonsWidget(
                  primaryLabel: primaryLabel,
                  primaryOnPressed: primaryOnPressed,
                  secondaryLabel: secondaryLabel,
                  secondaryOnPressed: secondaryOnPressed,
                  enablePrimaryColor: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

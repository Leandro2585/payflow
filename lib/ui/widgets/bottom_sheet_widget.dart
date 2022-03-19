import 'package:flutter/material.dart';
import 'package:payflow/ui/styles/index.dart';
import 'package:payflow/ui/widgets/index.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String primaryLabel;
  final VoidCallback primaryHandle;
  final String secondaryLabel;
  final VoidCallback secondaryHandle;

  const BottomSheetWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.primaryLabel,
    required this.primaryHandle,
    required this.secondaryLabel,
    required this.secondaryHandle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                    child: Container(color: Colors.black.withOpacity(0.9))),
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
                              text: "\n$subtitle",
                              style: TextStyles.buttonHeading,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.stroke,
                    ),
                    SeveralLabelButtons(
                      primaryLabel: primaryLabel,
                      primaryHandle: primaryHandle,
                      secondaryLabel: secondaryLabel,
                      secondaryHandle: secondaryHandle,
                      enablePrimaryColor: true,
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

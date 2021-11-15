import 'package:flutter/cupertino.dart';
import 'package:payflow/app/widgets/index.dart';

class SetLabelButtonsWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  const SetLabelButtonsWidget({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButtonWidget(
              label: primaryLabel,
              onPressed: primaryOnPressed,
            ),
          ),
          DividerVerticalWidget(),
          Expanded(
            child: LabelButtonWidget(
              label: secondaryLabel,
              onPressed: secondaryOnPressed,
            ),
          )
        ],
      ),
    );
  }
}

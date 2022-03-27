import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/data/models/index.dart';
import 'package:payflow/ui/styles/app_text_styles.dart';

class TicketTileWidget extends StatelessWidget {
  final TicketModel data;
  const TicketTileWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.description!,
          style: TextStyles.titleListTile,
        ),
        subtitle: Text(
          'Vence em ${data.dueDate}',
          style: TextStyles.captionBody,
        ),
        trailing: Text.rich(
          TextSpan(
            text: 'R\$',
            style: TextStyles.trailingRegular,
            children: [
              TextSpan(
                text: data.value!.toStringAsFixed(2),
                style: TextStyles.trailingBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

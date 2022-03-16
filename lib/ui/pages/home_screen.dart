import 'package:flutter/material.dart';
import 'package:payflow/ui/components/app_colors.dart';
import 'package:payflow/ui/components/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(152), 
      child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: 'Olá, ', 
                  style: TextStyles.titleRegular,
                  children: [
                    TextSpan(text: 'Ola Leandro', style: TextStyles.titleBoldBackground),
                  ],
                ),
              ),
              subtitle: Text(
                'Matenha suas contar em dia',
                style: TextStyles.captionShape,
              ),
              trailing: Container(
                height: 48, 
                width: 48, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.home, color: AppColors.primary)),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary, 
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  onPressed: (){}, 
                  icon: const Icon(
                    Icons.add_box_outlined, 
                    color: AppColors.shape,
                  ),
                ),
              ),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.description_outlined, color: AppColors.body)),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/app/modules/index.dart';
import 'package:payflow/app/themes/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = HomeController();
  final pages = [
    Container(color: Colors.red),
    Container(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: ListTile(
            title: Text.rich(
              TextSpan(
                text: 'Olá, ',
                style: TextStyles.titleRegular,
                children: [
                  TextSpan(
                    text: 'Leandro Real',
                    style: TextStyles.titleBoldBackground,
                  )
                ],
              ),
            ),
            subtitle: Text('Mantenha suas contas em dia',
                style: TextStyles.captionShape),
            trailing: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
      body: pages[homeController.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                homeController.setPage(0);
                setState(() {});
              },
              icon: Icon(Icons.home),
              color: AppColors.primary,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                homeController.setPage(1);
                setState(() {});
              },
              icon: Icon(Icons.description_outlined),
              color: AppColors.body,
            )
          ],
        ),
      ),
    );
  }
}

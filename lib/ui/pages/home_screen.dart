import 'package:flutter/material.dart';
import 'package:payflow/application/controllers/index.dart';
import 'package:payflow/data/models/index.dart';
import 'package:payflow/ui/styles/index.dart';
import 'package:payflow/ui/widgets/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = HomeController();
  final pages = [
    Container(color: Colors.red, child: TicketTileWidget(data: TicketModel())),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
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
                    TextSpan(
                      text: 'Leandro',
                      style: TextStyles.titleBoldBackground,
                    ),
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
      body: pages[homeController.currentPage],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            onPressed: () {
              homeController.setPage(0);
              setState(() {});
            },
            icon: Icon(
              Icons.home,
              color: homeController.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
            ),
          ),
          GestureDetector(
            onTap: () async {
              await Navigator.pushNamed(context, '/barcode_scanner');
              setState(() {});
            },
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.add_box_outlined,
                color: AppColors.shape,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              homeController.setPage(1);
              setState(() {});
            },
            icon: Icon(
              Icons.description_outlined,
              color: homeController.currentPage == 1
                  ? AppColors.primary
                  : AppColors.body,
            ),
          ),
        ]),
      ),
    );
  }
}

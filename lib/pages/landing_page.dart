import 'package:flutter/material.dart';
import 'package:landing_page/pages/products.dart';
import 'package:landing_page/utils/app_bar_widget.dart';
import 'package:provider/provider.dart';

import '../buttons/whatsapp_fab.dart';
import '../page_selector.dart';
import 'about_us.dart';
import 'home.dart';
import 'join_us.dart';

class LandingPage extends StatelessWidget {

  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final buttonPositionRight = screenWidth - (screenWidth * 27 / 28);
    final buttonPositionTop = screenHeight - (2 * screenHeight / 16);


    List<Widget> pagesWidgets = [
      const Home(),
      const AboutUs(),
      const Products(),
      const JoinUs()
    ];



    return Consumer<SelectionIndexProvider>(
        builder: (BuildContext context, value, Widget? child) {

      final pageController =
          Provider.of<SelectionIndexProvider>(context);
      pageController.setAppBarVisibility(context);
      return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar:  true,
        appBar: pageController.isAppBarVisible
            ? PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height / 8),
                child: const AppBarWidget(),
              )
            : null,
        body: Stack(
          children: [
            PageView(
              physics: const ScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              pageSnapping: false,
              controller:
                  Provider.of<SelectionIndexProvider>(context, listen: false)
                      .pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: (index) {
                final provider =
                    Provider.of<SelectionIndexProvider>(context, listen: false);
                provider.setSelectionIndex(index);
              },
              children: pagesWidgets,
            ),
            Positioned(
                top: buttonPositionTop,
                right: buttonPositionRight,
                child: const WhatsAppFAB(whatsappIcon: "images/whatsapp.png")),
          ],
        ),
      );
    });
  }
}


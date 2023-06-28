import 'package:flutter/material.dart';
import 'package:landing_page/page_selector.dart';
import 'package:landing_page/pages/landing_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (BuildContext context) {
          return SelectionIndexProvider();
        },
        child: const LandingPage(),
      ),
    );
  }
}




Widget buildNavigationButton(List<String> pages, String page) {
  int selectedPageIndex = pages.indexOf(page);
  return Consumer<SelectionIndexProvider>(
      builder: (BuildContext context, value, Widget? child) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            )),
            backgroundColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              const Color(0xFFc3c2cd),
            ),
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            foregroundColor: MaterialStateProperty.all(
              const Color(0xFF000d16),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: selectedPageIndex ==
                        Provider.of<SelectionIndexProvider>(context)
                            .selectionIndex
                    ? 24
                    : 20,
                color: Colors.white,
                fontWeight: selectedPageIndex ==
                        Provider.of<SelectionIndexProvider>(context)
                            .selectionIndex
                    ? FontWeight.w900
                    : FontWeight.normal,
              ),
            )),
        onPressed: () {
          Provider.of<SelectionIndexProvider>(context, listen: false)
              .setSelectionIndex(selectedPageIndex);
          Provider.of<SelectionIndexProvider>(context, listen: false)
              .setPageController(selectedPageIndex);
        },
        child: Text(page),
      ),
    );
  });
}

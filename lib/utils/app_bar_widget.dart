import 'package:flutter/material.dart';
import 'package:landing_page/page_selector.dart';
import 'package:provider/provider.dart';

import '../buttons/social_buttons.dart';

const String homePage = 'Home     ';
const String package = 'Packages';
const String aboutPage = 'About Us';
const String joinUs = 'Join Us  ';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> pages = [
      homePage,
      aboutPage,
      package,
      joinUs,
    ];
    return Consumer<SelectionIndexProvider>(
        builder: (BuildContext context, value, Widget? child) {
          final selectionIndexProvider =
          Provider.of<SelectionIndexProvider>(context, listen: false);

          selectionIndexProvider.setAppBarElevation(context);

          return AppBar(
            scrolledUnderElevation: selectionIndexProvider.isAppBarElevated
                ? 4
                : 0,
            elevation: 0,
            foregroundColor: Colors.transparent,
            flexibleSpace: Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                const Spacer(
                  flex: 4,
                ),
                Expanded(
                  flex: 4,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: buildNavigationButton(pages, homePage)),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                    flex: 4,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: buildNavigationButton(pages, aboutPage))),
                const Spacer(
                  flex: 1,
                ),

                Expanded(
                    flex: 4,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: buildNavigationButton(pages, package))),

                const Spacer(
                  flex: 1,
                ),
                Expanded(
                    flex: 4,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: buildNavigationButton(pages, joinUs))),
                const Spacer(
                  flex: 18,
                ),
                const Flexible(
                  flex: 2,
                  child: SocialButton(imageUrl: 'images/gmail_icon.png')),
                const Spacer(
                  flex: 1,
                ),
                // Flexible(
                //   flex: 2,
                //   child: ConstrainedBox(
                //     constraints: BoxConstraints(
                //       minWidth: MediaQuery.of(context).size.width / 28,
                //       minHeight: MediaQuery.of(context).size.width / 16,
                //     ),
                //     child: Image.asset('images/instagram_icon.png'),
                //   ),
                // ),
                const Flexible(
                    flex: 2,
                    child: SocialButton(imageUrl: 'images/instagram_icon.png')),
                const Spacer(
                  flex: 1,
                ),
              ]),
            ),
            backgroundColor: selectionIndexProvider.isAppBarElevated
                ? Colors.white
                : Colors.transparent,
          );
        });
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
                //visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                foregroundColor: MaterialStateProperty.all(
                  const Color(0xFF000d16),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                ),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: selectedPageIndex ==
                        Provider
                            .of<SelectionIndexProvider>(context)
                            .selectionIndex
                        ? 20
                        : 16,
                    color: Colors.white,
                    fontWeight: selectedPageIndex ==
                        Provider
                            .of<SelectionIndexProvider>(context)
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



// class SocialButton extends StatefulWidget {
//   final String imageUrl;
//
//   const SocialButton({Key? key, required this.imageUrl}) : super(key: key);
//
//   @override
//   State<SocialButton> createState() => _SocialButtonState();
// }
//
// class _SocialButtonState extends State<SocialButton> {
//   bool _isHovered;
//
//   @override
//   void initState() {
//     final bool _isHovered = false;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(
//         minWidth: MediaQuery
//             .of(context)
//             .size
//             .width / 28,
//         minHeight: MediaQuery
//             .of(context)
//             .size
//             .height / 16,
//       ),
//       child: Stack(
//         children: [
//           MouseRegion(
//               onHover: (pointerHoverEvent) {
//                 setState(() {
//                   _isHovered = true;
//                 });
//               },
//               child: Container(
//                 color: _isHovered ? Colors.white : Colors.transparent,)),
//           Image.asset(widget.imageUrl),
//         ],
//       ),
//     );
//   }
// }


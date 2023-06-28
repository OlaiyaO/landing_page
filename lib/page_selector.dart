import 'package:flutter/material.dart';

class SelectionIndexProvider extends ChangeNotifier {
  int _selectionIndex = 0;
  bool _isAppBarVisible = true;
  bool _isAppBarElevated = false;

  final PageController _pageController = PageController();

  bool get isAppBarVisible => _isAppBarVisible;

  bool get isAppBarElevated => _isAppBarElevated;

  int get selectionIndex => _selectionIndex;

  PageController get pageController => _pageController;

  void setPageController(int newIndex) {
    _pageController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void setSelectionIndex(int newIndex) {
    _selectionIndex = newIndex;
    notifyListeners();
  }

  void setAppBarVisibility(BuildContext context) {
    _pageController.addListener(() {
      _pageController.position.pixels <
                  (MediaQuery.of(context).size.height * 1) / 16 ||
              _pageController.position.pixels >=
                  MediaQuery.of(context).size.height
          ? _isAppBarVisible = true
          : _isAppBarVisible = false;
      notifyListeners();
    });
  }

  void setAppBarElevation(BuildContext context) {
    _pageController.addListener(() {
      if (_pageController.page! >= 1) {
        _isAppBarElevated = true;
      } else {
        _isAppBarElevated = false;
      }
      notifyListeners();
    });
  }
}

// import 'package:flutter/material.dart';

// class SelectionIndexProvider extends ChangeNotifier {
//   int _selectionIndex = 0;
//   bool _isAppBarVisible = true;
//
//   final PageController _pageController = PageController();
//
//   bool get isAppBarVisible => _isAppBarVisible;
//
//   int get selectionIndex => _selectionIndex;
//
//   PageController get pageController => _pageController;
//
//   void setPageController(int newIndex) {
//     _pageController.animateToPage(
//       newIndex,
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   void setSelectionIndex(int newIndex) {
//     _selectionIndex = newIndex;
//     notifyListeners();
//   }
//
//   void setAppBarVisibility(BuildContext context) {
//
//     _pageController.addListener(() {
//       _pageController.position.pixels < (MediaQuery.of(context).size.height * 2) / 16 ||
//           _pageController.position.pixels > MediaQuery.of(context).size.height
//           ? _isAppBarVisible = true
//           : _isAppBarVisible = false;
//       notifyListeners();
//     });
//   }
// }

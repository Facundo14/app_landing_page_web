//import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> pages = ['home', 'about', 'pricing', 'contact', 'location'];

  int _currentIndex = 0;

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));

    html.document.title = pages[getPageIndex(routeName)];
    scrollController.addListener(() {
      final index = (scrollController.page ?? 0).round();

      if (index != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${pages[index]}');
        _currentIndex = index;
        html.document.title = pages[index];
      }
    });
  }

  int getPageIndex(String routeName) {
    return (pages.indexOf(routeName)) == -1 ? 0 : pages.indexOf(routeName);
  }

  goTo(int index) {
    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

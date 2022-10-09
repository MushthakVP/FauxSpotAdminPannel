import 'package:flutter/material.dart';

class ResponisiveLayout extends StatelessWidget {
  final Widget mobileView;
  final Widget tabView;
  final Widget desktopView;
  const ResponisiveLayout({
    super.key,
    required this.mobileView,
    required this.tabView,
    required this.desktopView,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 450) {
          return mobileView;
        } else if (constraints.minWidth >= 450 && constraints.maxWidth < 800) {
          return tabView;
        } else {
          return desktopView;
        }
      },
    );
  }
}

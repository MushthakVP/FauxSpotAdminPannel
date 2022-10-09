import 'package:faux_admin/app/layout/layoutbuilder.dart';
import 'package:faux_admin/app/module/desktop/home_view/view/home_screen.dart';
import 'package:faux_admin/app/module/mobile/home_screen/view/home_screen.dart';
import 'package:faux_admin/app/module/tablet/home_view/home_screen.dart';
import 'package:flutter/material.dart';

class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponisiveLayout(
      mobileView: HomeScreenMobile(),
      tabView: const HomeScreenTablet(),
      desktopView: HomeScreenDesktop(),
    );
  }
}

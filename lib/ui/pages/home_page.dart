import 'package:app_landing_page/providers/page_provider.dart';
import 'package:flutter/material.dart';

import 'package:app_landing_page/ui/views/home_view.dart';

import 'package:app_landing_page/ui/shared/custom_app_menu.dart';
import 'package:app_landing_page/ui/views/about_view.dart';
import 'package:app_landing_page/ui/views/contact_view.dart';
import 'package:app_landing_page/ui/views/location_view.dart';
import 'package:app_landing_page/ui/views/pricing_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            _HomeBody(),
            Positioned(
              right: size.width * 0.01,
              top: size.width * 0.01,
              child: CustomAppMenu(),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.orange,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
        ),
      );
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return PageView(
      scrollDirection: Axis.vertical,
      controller: pageProvider.scrollController,
      physics: const BouncingScrollPhysics(),
      children: const [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}

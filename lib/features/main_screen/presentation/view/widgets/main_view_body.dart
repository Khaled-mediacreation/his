import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:his/core/helpers/indexed_stack_provider.dart';
import 'package:his/features/bookmarks/presentation/view/bookmarks_view.dart';
import 'package:his/features/category/presentation/view/category_view.dart';
import 'package:his/features/home/presentation/view/home_view.dart';
import 'package:his/features/main_screen/presentation/view/widgets/custom_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  Map<int, GlobalKey> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {
    final indexStack = Provider.of<IndexStackProvider>(context);

    List<Widget> screens = [
      HomeView(navigatorKey: navigatorKeys[0]!),
      CategoryView(navigatorKey: navigatorKeys[1]!),
      BookmarksView(navigatorKey: navigatorKeys[2]!),
      const Center(
        child: Text('Profile'),
      ),
    ];
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        onItemTapped: (value) {
          indexStack.setIndex(value);
          setState(() {});
        },
      ),
      body: SafeArea(
          child: PopScope(
        canPop: false, // Prevents default back button behavior
        onPopInvokedWithResult: (bool didPop, _) async {
          if (didPop) return Future.value(true);

          log('On Pop invoked ${navigatorKeys[indexStack.currentIndex]!.currentState!.context.widget}');
          final canPop = await Navigator.maybePop(
              navigatorKeys[indexStack.currentIndex]!.currentState!.context);

          if (!canPop) {
            // If we can't pop (we're at root), ask if user wants to exit
            SystemNavigator.pop(); // Exit the app
            return Future.value(true); // We handled it ourselves
          }
          return Future.value(false); // Allow normal pop
        },
        child: IndexedStack(index: indexStack.currentIndex, children: screens),
      )),
    );
  }
}

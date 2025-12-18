import 'package:crypto_x/features/home/presentation/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:crypto_x/features/home/presentation/ui/widgets/main_view_body.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _HomeViewState();
}

class _HomeViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainViewBody(currentViewIndex: currentViewIndex),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: currentViewIndex,
        onTap: (index) {
          setState(() {
            currentViewIndex = index;
          });
        },
      ),
    );
  }
}

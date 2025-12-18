import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onTap;
  final int selectedIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    this.selectedIndex = 0,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        items: [
          BottomNavigationBarItem(
            icon: _buildSvgIcon(
              activeIcon: AppSvgAssets.activeHome,
              inactiveIcon: AppSvgAssets.inActiveHome,
              isActive: _selectedIndex == 0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(
              activeIcon: AppSvgAssets.activeChart,
              inactiveIcon: AppSvgAssets.inActiveChart,
              isActive: _selectedIndex == 1,
            ),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(
              activeIcon: 'assets/icons/portfolio_active.svg',
              inactiveIcon: AppSvgAssets.inActiveportfolio,
              isActive: _selectedIndex == 2,
            ),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(
              activeIcon: 'assets/icons/settings_active.svg',
              inactiveIcon: AppSvgAssets.inActiveSetting,
              isActive: _selectedIndex == 3,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildSvgIcon({
    required String activeIcon,
    required String inactiveIcon,
    required bool isActive,
  }) {
    return SvgPicture.asset(
      isActive ? activeIcon : inactiveIcon,
      width: 24,
      height: 24,
    );
  }
}

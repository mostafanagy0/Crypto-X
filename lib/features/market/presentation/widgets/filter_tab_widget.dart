import 'package:crypto_x/features/market/presentation/widgets/filter_tab_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterTabWidgets extends StatefulWidget {
  const FilterTabWidgets({super.key});

  @override
  State<FilterTabWidgets> createState() => _FilterTabWidgetsState();
}

class _FilterTabWidgetsState extends State<FilterTabWidgets> {
  final List categories = const ['All', 'DeFi', 'NFT', 'Gaming', 'Metaverse'];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryContainerWidget(
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() => selectedIndex = index);
            },
            text: categories[index],
          );
        },
      ),
    );
  }
}

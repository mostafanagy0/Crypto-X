import 'package:crypto_x/features/home/presentation/ui/widgets/top_gainers_list_view_item.dart';
import 'package:flutter/material.dart';

class TopGainersListView extends StatelessWidget {
  const TopGainersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TopGainersListViewItem();
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
    );
  }
}

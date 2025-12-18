
import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';

class MarketGridWidget extends StatelessWidget {
  const MarketGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 6,
          childAspectRatio: 1.7, // height to width ratio
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          // بيانات مختلفة لكل card
          final List<Map<String, String>> cardData = [
            {'title': 'Market Cap', 'value': '\$1,567B'},
            {'title': 'Volume', 'value': '\$234B'},
            {'title': 'Bitcoin Dom', 'value': '42.5%'},
            {'title': 'Altcoin Dom', 'value': '57.5%'},
          ];
    
          return Card(
            elevation: 1,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
    
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      cardData[index]['title']!,
                      style: TextStyles.font14Medium.copyWith(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  verticalSpace(8),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      cardData[index]['value']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

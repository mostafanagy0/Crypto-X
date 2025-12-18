import 'package:crypto_x/features/market/data/models/coin_model.dart';
import 'package:crypto_x/features/market/domain/entity/coin.dart';
import 'package:crypto_x/features/market/presentation/widgets/coin_item_widget.dart';
import 'package:flutter/material.dart';

class CoinsListWidgets extends StatefulWidget {
  const CoinsListWidgets({super.key, required this.coins});
  final List<Coin> coins;

  @override
  State<CoinsListWidgets> createState() => _CoinsListWidgetsState();
}

class _CoinsListWidgetsState extends State<CoinsListWidgets> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.coins.length,
      itemBuilder: (context, index) {
        return CoinItemWidget(
          coinModel: CoinModel(
            id: widget.coins[index].id,
            coinName: widget.coins[index].coinName,
            image: widget.coins[index].image,
            rank: widget.coins[index].rank,
            currentPrice: widget.coins[index].currentPrice,
            changePercentage: widget.coins[index].changePercentage,
          ),
        );
      },
    );
  }
}

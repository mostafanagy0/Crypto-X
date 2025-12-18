import 'package:crypto_x/features/market/data/models/search_model.dart';
import 'package:crypto_x/features/market/domain/entity/search_coin.dart';
import 'package:crypto_x/features/market/presentation/widgets/search_coin_item_widget.dart';
import 'package:flutter/material.dart';

class SearchCoinsListWidgets extends StatefulWidget {
  const SearchCoinsListWidgets({super.key, required this.coins});
  final List<SearchCoin> coins;

  @override
  State<SearchCoinsListWidgets> createState() => _SearchCoinsListWidgetsState();
}

class _SearchCoinsListWidgetsState extends State<SearchCoinsListWidgets> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.coins.length,
      itemBuilder: (context, index) {
        return SearchCoinItemWidget(
          searchCoinModel: SearchCoinModel(
            id: widget.coins[index].id,
            name: widget.coins[index].name,
            symbol: widget.coins[index].symbol,
            marketCapRank: widget.coins[index].marketCapRank,
            image: widget.coins[index].image,
          ),
        );
      },
    );
  }
}

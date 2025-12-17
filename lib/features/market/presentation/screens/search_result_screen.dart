import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/features/market/presentation/cubit/search/search_cubit.dart';
import 'package:crypto_x/features/market/presentation/cubit/search/search_state.dart';
import 'package:crypto_x/features/market/presentation/widgets/search_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsScreen extends StatelessWidget {
  final String query;

  const SearchResultsScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    context.read<SearchCubit>().searchCoins(query);

    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.backgroundColor,
        surfaceTintColor: ColorsManager.backgroundColor,
        elevation: 0,
        centerTitle: true,
        foregroundColor: ColorsManager.primaryBlue,
        title: Text('Search Results', style: TextStyles.font24BoldPrimaryBlue),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is SearchError) {
              return Center(child: Text(state.message));
            }

            if (state is SearchLoaded) {
              return SearchCoinsListWidgets(coins: state.results);
            }

            return Center(child: Text('No results'));
          },
        ),
      ),
    );
  }
}

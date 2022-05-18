import 'package:digital_marketing/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/trendingcource/trendincource_bloc.dart';
import '../dao/cource_model.dart';
import 'cource_new_card.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<CourceModel> cources;
    bool isLoading = false;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 5),
        const SectionTitle(title: 'Trending Cource '),
        const SizedBox(height: 5),
        BlocBuilder<TrendincourceBloc, TrendincourceState>(
          builder: (context, state) {
            if (state is TrendincourceLoading) {
              isLoading = true;
            } else if (state is TrendingcourceLoaded) {
              isLoading = false;
              cources = state.cources;
            }
            return SizedBox(
              height: 350,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 8),
                shrinkWrap: true,
                itemCount: isLoading ? 1 : cources.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  if (isLoading) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                  return CourceNewCard(
                    cource: cources[i],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

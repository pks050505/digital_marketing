import 'package:digital_marketing/widgets/cource_new_card.dart';
import 'package:digital_marketing/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/allcource/allcource_bloc.dart';
import '../dao/cource_model.dart';

class AllCourcesWidget extends StatelessWidget {
  const AllCourcesWidget({
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
        const SectionTitle(title: 'All Cources'),
        const SizedBox(height: 5),
        BlocBuilder<AllCourceBloc, AllCourceState>(
          builder: (context, state) {
            if (state is AllCourceLoading) {
              isLoading = true;
            } else if (state is AllCourceLoaded) {
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
                      child: CircularProgressIndicator.adaptive(),
                    );
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

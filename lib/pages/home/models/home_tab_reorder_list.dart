import 'package:flutter/material.dart';
import 'package:football/pages/home/models/home_tab_model.dart';
import 'package:football/pages/home/models/home_tab_reorder_card.dart';
import 'package:provider/provider.dart';

class HomeTabReorderList extends StatelessWidget {
  const HomeTabReorderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeTabModel>();

    return ReorderableList(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model.value.entries.length,
      onReorder: model.reorder,
      itemBuilder: (_, index) => HomeTabReorderCard(
        index: index,
        model: model,
      ),
    );
  }
}

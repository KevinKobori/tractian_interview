import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tractian_interview/src/design_system/organisms/challenge_app_bar.dart';
import 'package:tractian_interview/src/features/asset/data/models/tree_node.dart';

class AssetPageLoadedSuccessView extends StatelessWidget {
  final List<TreeNode> trees;
  final void Function(String value) onSearch;

  const AssetPageLoadedSuccessView({
    required this.trees,
    required this.onSearch,
    super.key,
  });

  Widget buildTreesWidget(List<TreeNode> trees) {
    for (final tree in trees) {
      printTree(tree);
    }
    return Container();
  }

  void printTree(TreeNode node, [int level = 0]) {
    final String indentation = '  ' * level;
    log('$indentation${node.object.name}');
    for (final child in node.children) {
      printTree(child, level + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChallengeAppBar(pageTitle: 'Asset'),
      body: buildTreesWidget(trees),
    );
  }
}

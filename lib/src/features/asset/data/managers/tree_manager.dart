import 'package:tractian_interview/src/core/data/models/asset_model.dart';
import 'package:tractian_interview/src/features/asset/data/models/tree_node.dart';

class TreeManager {
  static AssetModel? returnAssetModelObject(dynamic value) {
    if (value is AssetModel) {
      return value;
    } else {
      return null;
    }
  }

  static List<List<dynamic>> findBranches(
      List<dynamic> list, List<String> ids) {
    final List<List<dynamic>> branches = [];

    for (final id in ids) {
      final branch = <dynamic>[list.firstWhere((element) => element.id == id)];

      String? parentId = branch[0].parentId;
      while (parentId != null) {
        final parent = list.firstWhere((element) => element.id == parentId,
            orElse: () => null);
        if (parent != null) {
          branch.insert(0, parent);
        }
        parentId = parent?.parentId;
      }

      String? locationId = returnAssetModelObject(branch[0])?.locationId;
      while (locationId != null) {
        final parent = list.firstWhere((element) => element.id == locationId,
            orElse: () => null);
        if (parent != null) {
          branch.insert(0, parent);
        }
        locationId = returnAssetModelObject(parent)?.locationId;
      }

      while (branch.isNotEmpty && branch.first.parentId != null) {
        final parentId = branch.first.parentId!;
        final parent = list.firstWhere((element) => element.id == parentId,
            orElse: () => null);
        if (parent != null) {
          branch.insert(0, parent);
        }
      }

      branches.add(branch);
    }

    return branches;
  }

  static List<TreeNode> buildTrees(List<List<dynamic>> branches) {
    final Map<String, TreeNode> nodeMap = {};
    final List<TreeNode> trees = [];

    for (final branch in branches) {
      TreeNode? parent;
      for (int i = 0; i < branch.length; i++) {
        final object = branch[i];
        if (!nodeMap.containsKey(object.id)) {
          final node = TreeNode(object);
          nodeMap[object.id] = node;
          if (parent != null) {
            parent.addChild(node);
          } else {
            trees.add(node);
          }
        }
        parent = nodeMap[object.id];
      }
    }

    return trees;
  }
}

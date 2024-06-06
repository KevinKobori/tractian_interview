import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tractian_interview/src/core/data/models/asset_model.dart';
import 'package:tractian_interview/src/core/data/models/location_model.dart';
import 'package:tractian_interview/src/design_system/challenge_metrics.dart';
import 'package:tractian_interview/src/design_system/organisms/challenge_app_bar.dart';
import 'package:tractian_interview/src/features/asset/data/models/asset_tree_node.dart';

class AssetPageLoadedSuccessView extends StatefulWidget {
  final List<AssetTreeNode> trees;
  final void Function(String value) onSearchByName;

  const AssetPageLoadedSuccessView({
    required this.trees,
    required this.onSearchByName,
    super.key,
  });

  @override
  State<AssetPageLoadedSuccessView> createState() =>
      _AssetPageLoadedSuccessViewState();
}

class _AssetPageLoadedSuccessViewState
    extends State<AssetPageLoadedSuccessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChallengeAppBar(pageTitle: 'Asset'),
      body: ListView(
        children: widget.trees.map((tree) => buildTree(tree)).toList(),
      ),
    );
  }

  Widget buildTree(AssetTreeNode node, [int level = 0]) {
    return Padding(
      padding: EdgeInsets.only(left: level == 0 ? 0.0 : 32.0),
      child: _CustomExpansionTile(
        title: Text(node.object.name),
        icon: _getNodeIcon(node),
        children:
            node.children.map((child) => buildTree(child, level + 1)).toList(),
      ),
    );
  }

  Widget _getNodeIcon(AssetTreeNode node) {
    final colorFilter = ColorFilter.mode(
      ChallegeMetrics.iconColor,
      BlendMode.srcIn,
    );
    const iconSize = ChallegeMetrics.nodeTileIconSize;

    if (node.object is LocationModel) {
      return SvgPicture.asset(
        'images/icons/location.svg',
        colorFilter: colorFilter,
        height: iconSize,
        width: iconSize,
      );
    } else if (node.object is AssetModel) {
      final asset = node.object as AssetModel;
      if (asset.sensorType == null) {
        return SvgPicture.asset(
          'images/icons/asset.svg',
          colorFilter: colorFilter,
          height: iconSize,
          width: iconSize,
        );
      } else {
        return SvgPicture.asset(
          'images/icons/component.svg',
          colorFilter: colorFilter,
          height: iconSize,
          width: iconSize,
        );
      }
    } else {
      return const Icon(Icons.device_unknown);
    }
  }
}

class _CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final Widget icon;
  final List<Widget> children;
  // final bool hasChildren;

  const _CustomExpansionTile({
    required this.title,
    required this.icon,
    required this.children,
    // required this.hasChildren,
  });

  @override
  __CustomExpansionTileState createState() => __CustomExpansionTileState();
}

class __CustomExpansionTileState extends State<_CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = true;

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool hasChildren = widget.children.isNotEmpty;

    return Column(
      children: [
        ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              hasChildren
                  ? AnimatedRotation(
                      turns: _isExpanded ? 0.0 : -0.25,
                      duration: const Duration(milliseconds: 300),
                      child: SvgPicture.asset(
                        'images/icons/tree_arrow.svg',
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                        height: ChallegeMetrics.nodeTileArrowSize,
                        width: ChallegeMetrics.nodeTileArrowSize,
                      ),
                    )
                  : const SizedBox(width: ChallegeMetrics.nodeTileArrowSize),
              const SizedBox(width: 16),
              widget.icon,
            ],
          ),
          title: widget.title,
          onTap: hasChildren ? _handleTap : null,
        ),
        if (hasChildren)
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Column(children: widget.children),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
            firstCurve: Curves.easeInOut,
            secondCurve: Curves.easeInOut,
          ),
      ],
    );
  }
}

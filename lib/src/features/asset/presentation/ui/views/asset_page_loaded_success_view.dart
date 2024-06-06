import 'dart:math';

import 'package:flutter/foundation.dart';
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

  Widget buildTree(AssetTreeNode node,
      [bool isLastOfChildrens = false, int level = 0]) {
    return Stack(
      children: [
        TreeLines(
          isFirst: level == 0,
          isLast: node.children.isEmpty,
          isLastOfChildrens: isLastOfChildrens,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: level == 0 ? 0.0 : ChallegeMetrics.nodeTileLeftPadding),
          child: _CustomExpansionTile(
            hintText: node.object.name,
            title: Text(
              node.object.name,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            icon: _getIconForNode(node),
            hasChildren: node.children.isNotEmpty,
            children: node.children.map((child) {
              final value = child.object.id ==
                  node.children[node.children.length - 1].object.id;
              return buildTree(child, value, level + 1);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _getIconForNode(AssetTreeNode node) {
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

class TreeLines extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isLastOfChildrens;

  const TreeLines({
    required this.isFirst,
    required this.isLast,
    required this.isLastOfChildrens,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const leftSpace = 23.0;
    const tileHeight = 56.0;

    return CustomPaint(
      painter: _TreeLinesPainter(
        isFirst: isFirst,
        isLast: isLast,
        isLastOfChildrens: isLastOfChildrens,
      ),
      child: const SizedBox(width: leftSpace, height: tileHeight),
    );
  }
}

class _TreeLinesPainter extends CustomPainter {
  final bool isFirst;
  final bool isLast;
  final bool isLastOfChildrens;

  _TreeLinesPainter({
    required this.isFirst,
    required this.isLast,
    required this.isLastOfChildrens,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ChallegeMetrics.nodeTileLinesColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final double startX = size.width;
    final double endX = startX * 2;

    if (!isFirst) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX, size.height / 2),
        paint,
      );
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(endX, size.height / 2),
        paint,
      );
      if (!isLast) {
        canvas.drawLine(
          Offset(startX + ChallegeMetrics.nodeTileLeftPadding, 38),
          Offset(startX + ChallegeMetrics.nodeTileLeftPadding, size.height),
          paint,
        );
      } else if (isLast && !isLastOfChildrens) {
        canvas.drawLine(
          Offset(startX, 28),
          Offset(startX, size.height),
          paint,
        );
      }
    } else if (isFirst && !isLast) {
      canvas.drawLine(
        Offset(startX, 38),
        Offset(startX, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final Widget icon;
  final List<Widget> children;
  final bool hasChildren;
  final String hintText;

  const _CustomExpansionTile({
    required this.title,
    required this.icon,
    required this.children,
    required this.hasChildren,
    required this.hintText,
  });

  @override
  __CustomExpansionTileState createState() => __CustomExpansionTileState();
}

class __CustomExpansionTileState extends State<_CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _getRandomColor(),
      child: Tooltip(
        message: widget.hintText,
        waitDuration: const Duration(seconds: 1),
        child: Column(
          children: [
            ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.hasChildren
                      ? AnimatedRotation(
                          turns: _isExpanded ? 0.0 : -0.25,
                          duration: const Duration(milliseconds: 300),
                          child: SvgPicture.asset(
                            'images/icons/tree_arrow.svg',
                            colorFilter: const ColorFilter.mode(
                              ChallegeMetrics.nodeTileIndicatorColor,
                              BlendMode.srcIn,
                            ),
                            height: ChallegeMetrics.nodeTileIndicatorSize,
                            width: ChallegeMetrics.nodeTileIndicatorSize,
                          ),
                        )
                      : const Icon(
                          Icons.fiber_manual_record,
                          color: ChallegeMetrics.nodeTileIndicatorColor,
                          size: ChallegeMetrics.nodeTileIndicatorSize,
                        ),
                  const SizedBox(width: 16),
                  widget.icon,
                ],
              ),
              title: widget.title,
              onTap: widget.hasChildren ? _handleTap : null,
            ),
            if (widget.hasChildren)
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
        ),
      ),
    );
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  Color _getRandomColor() {
    final Random random = Random();
    if (kDebugMode) {
      return Color.fromARGB(
        32,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    } else {
      return Colors.transparent;
    }
  }
}

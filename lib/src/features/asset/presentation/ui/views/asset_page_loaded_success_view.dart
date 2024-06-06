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
      body: ListView.builder(
        itemCount: widget.trees.length,
        itemBuilder: (context, index) {
          final node = widget.trees[index];
          return buildTree(node);
        },
      ),
    );
  }

  Widget buildTree(AssetTreeNode node, [int level = 0]) {
    return TreeNodeWidget(
      parentNode: null,
      currentNode: node,
      level: level,
      isLastOfChildrens: false,
      parentHaveBrother: false,
    );
  }
}

class TreeNodeWidget extends StatefulWidget {
  final AssetTreeNode? parentNode;
  final AssetTreeNode currentNode;
  final int level;
  final bool isLastOfChildrens;
  final bool parentHaveBrother;

  const TreeNodeWidget({
    required this.parentNode,
    required this.currentNode,
    required this.level,
    required this.isLastOfChildrens,
    required this.parentHaveBrother,
    super.key,
  });

  @override
  State<TreeNodeWidget> createState() => _TreeNodeWidgetState();
}

class _TreeNodeWidgetState extends State<TreeNodeWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.level == 0 || widget.level == 1
              ? 0.0
              : ChallegeMetrics.nodeTileLeftPadding),
      child: Tooltip(
        message: widget.currentNode.object.name,
        showDuration: const Duration(seconds: 5),
        child: Column(
          children: [
            Stack(
              children: [
                TreeLines(
                  isFirst: widget.level == 0,
                  isLast: widget.currentNode.children.isEmpty,
                  isLastOfChildrens: widget.isLastOfChildrens,
                  parentHaveBrother: widget.parentHaveBrother,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: widget.level == 0
                        ? 0.0
                        : ChallegeMetrics.nodeTileLeftPadding,
                  ),
                  child: ListTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.currentNode.children.isNotEmpty
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isExpanded = !_isExpanded;
                                  });
                                },
                                child: AnimatedRotation(
                                  turns: _isExpanded ? 0.0 : -0.25,
                                  duration: const Duration(milliseconds: 300),
                                  child: SvgPicture.asset(
                                    'images/icons/tree_arrow.svg',
                                    colorFilter: const ColorFilter.mode(
                                      ChallegeMetrics.nodeTileIndicatorColor,
                                      BlendMode.srcIn,
                                    ),
                                    height:
                                        ChallegeMetrics.nodeTileIndicatorSize,
                                    width:
                                        ChallegeMetrics.nodeTileIndicatorSize,
                                  ),
                                ),
                              )
                            : const Icon(
                                Icons.fiber_manual_record,
                                color: ChallegeMetrics.nodeTileIndicatorColor,
                                size: ChallegeMetrics.nodeTileIndicatorSize,
                              ),
                        const SizedBox(width: 16),
                        _getIconForNode(widget.currentNode),
                      ],
                    ),
                    title: Text(
                      widget.currentNode.object.name,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ],
            ),
            if (_isExpanded)
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: widget.currentNode.children.length,
                itemBuilder: (context, index) {
                  final child = widget.currentNode.children[index];
                  final isLastOfChildrens =
                      index == widget.currentNode.children.length - 1;
                  bool parentHaveBrother = false;
                  if (widget.parentNode != null &&
                      widget.parentNode!.children.isNotEmpty) {
                    parentHaveBrother = widget
                            .parentNode!
                            .children[widget.parentNode!.children.length - 1]
                            .object
                            .id !=
                        widget.currentNode.object.id;
                  }

                  return TreeNodeWidget(
                    parentNode: widget.currentNode,
                    currentNode: child,
                    level: widget.level + 1,
                    isLastOfChildrens: isLastOfChildrens,
                    parentHaveBrother: parentHaveBrother,
                  );
                },
              ),
          ],
        ),
      ),
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
  final bool parentHaveBrother;

  const TreeLines({
    required this.isFirst,
    required this.isLast,
    required this.isLastOfChildrens,
    required this.parentHaveBrother,
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
        parentHaveBrother: parentHaveBrother,
      ),
      child: const SizedBox(width: leftSpace, height: tileHeight),
    );
  }
}

class _TreeLinesPainter extends CustomPainter {
  final bool isFirst;
  final bool isLast;
  final bool isLastOfChildrens;
  final bool parentHaveBrother;

  _TreeLinesPainter({
    required this.isFirst,
    required this.isLast,
    required this.isLastOfChildrens,
    required this.parentHaveBrother,
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
      }
      if (!isLastOfChildrens) {
        canvas.drawLine(
          Offset(startX, 28),
          Offset(startX, size.height),
          paint,
        );
      }
      if (parentHaveBrother) {
        canvas.drawLine(
          Offset(startX - ChallegeMetrics.nodeTileLeftPadding, 0),
          Offset(startX - ChallegeMetrics.nodeTileLeftPadding, size.height),
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

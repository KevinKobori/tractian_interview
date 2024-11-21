import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tractian_interview/core/data/models/asset_model.dart';
import 'package:tractian_interview/core/data/models/location_model.dart';
import 'package:tractian_interview/design_system/challenge_metrics.dart';
import 'package:tractian_interview/design_system/molecules/challenge_outlined_button.dart';
import 'package:tractian_interview/design_system/molecules/challenge_text_field.dart';
import 'package:tractian_interview/design_system/organisms/challenge_app_bar.dart';
import 'package:tractian_interview/src/features/asset/data/managers/tree_manager.dart';
import 'package:tractian_interview/src/features/asset/data/models/asset_tree_node.dart';
import 'package:tractian_interview/src/features/asset/presentation/ui/helpers/tree_lines_builder.dart';

class AssetPageLoadedSuccessView extends StatelessWidget {
  final List<AssetTreeNode> trees;
  final void Function(String value) onSearchByName;
  final void Function() onSearchByEnergySensor;
  final void Function() onSearchByAlertStatus;

  const AssetPageLoadedSuccessView({
    required this.trees,
    required this.onSearchByName,
    required this.onSearchByEnergySensor,
    required this.onSearchByAlertStatus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChallengeAppBar(pageTitle: 'Asset'),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: ChallegeMetrics.textFieldLeftMargin),
            child: ChallengeTextField(onSearchByName: onSearchByName),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: ChallegeMetrics.buttonMargin),
            child: Row(
              children: [
                ChallengeOutlinedButton(
                  iconName: 'energy_outlined',
                  label: 'Sensor de Energia',
                  onPressed: onSearchByEnergySensor,
                ),
                const SizedBox(width: 8.0),
                ChallengeOutlinedButton(
                  iconName: 'alert_outlined',
                  label: 'Crítico',
                  onPressed: onSearchByAlertStatus,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Divider(color: ChallegeMetrics.dividerColor),
          Expanded(
            child: ListView.builder(
              itemCount: trees.length,
              itemBuilder: (context, index) {
                final node = trees[index];
                return _TreeNodeWidget(
                  parentNode: null,
                  currentNode: node,
                  level: 0,
                  isLastOfChildrens: false,
                  parentHaveBrother: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TreeNodeWidget extends StatefulWidget {
  final AssetTreeNode? parentNode;
  final AssetTreeNode currentNode;
  final int level;
  final bool isLastOfChildrens;
  final bool parentHaveBrother;

  const _TreeNodeWidget({
    required this.parentNode,
    required this.currentNode,
    required this.level,
    required this.isLastOfChildrens,
    required this.parentHaveBrother,
  });

  @override
  State<_TreeNodeWidget> createState() => _TreeNodeWidgetState();
}

class _TreeNodeWidgetState extends State<_TreeNodeWidget> {
  bool _isExpanded = false;
  final isNone = false;
  final isEnergy = false;
  final isAlert = false;

  @override
  Widget build(BuildContext context) {
    // final assetType =
    //     AssetTypeExtension.getAssetTypeFromObject(widget.currentNode.object);
    // final isEnergy = assetType == AssetType.energy;
    // final isAlert = assetType == AssetType.alert;
    final AssetModel? asset =
        TreeManager.returnAssetModelObject(widget.currentNode.object);
    final isEnergy = asset?.sensorType?.toLowerCase() == 'energy';
    final isAlert = asset?.status?.toLowerCase() == 'alert';

    return Padding(
      padding: EdgeInsets.only(
          left: widget.level == 0 || widget.level == 1
              ? 0.0
              : ChallegeMetrics.nodeTileLeftMargin),
      child: Tooltip(
        message: widget.currentNode.object.name,
        showDuration: const Duration(seconds: 5),
        child: Column(
          children: [
            Stack(
              children: [
                TreeLinesBuilder(
                  isFirst: widget.level == 0,
                  isLast: widget.currentNode.children.isEmpty,
                  isLastOfChildrens: widget.isLastOfChildrens,
                  parentHaveBrother: widget.parentHaveBrother,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: widget.level == 0
                        ? 0.0
                        : ChallegeMetrics.nodeTileLeftMargin,
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
                                    'assets/images/icons/tree_arrow.svg',
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
                    title: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Text(
                            widget.currentNode.object.name,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        if (isEnergy) ...[
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            'assets/images/icons/energy.svg',
                            colorFilter: ColorFilter.mode(
                              ChallegeMetrics.energyIconColor,
                              BlendMode.srcIn,
                            ),
                            height: ChallegeMetrics.nodeTileIndicatorSize,
                            width: ChallegeMetrics.nodeTileIndicatorSize,
                          ),
                        ],
                        if (isAlert) ...[
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            'assets/images/icons/alert.svg',
                            colorFilter: ColorFilter.mode(
                              ChallegeMetrics.alertIconColor,
                              BlendMode.srcIn,
                            ),
                            height: ChallegeMetrics.nodeTileIndicatorSize,
                            width: ChallegeMetrics.nodeTileIndicatorSize,
                          ),
                        ],
                      ],
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

                  return _TreeNodeWidget(
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
    if (node.object is LocationModel) {
      return _getIcon('location');
    } else if (node.object is AssetModel) {
      final asset = node.object as AssetModel;
      if (asset.sensorType == null) {
        return _getIcon('asset');
      } else {
        return _getIcon('component');
      }
    } else {
      return const Icon(Icons.device_unknown);
    }
  }

  Widget _getIcon(String iconName) {
    final colorFilter = ColorFilter.mode(
      ChallegeMetrics.iconColor,
      BlendMode.srcIn,
    );
    const iconSize = ChallegeMetrics.nodeTileIconSize;
    return SvgPicture.asset(
      'assets/images/icons/$iconName.svg',
      colorFilter: colorFilter,
      height: iconSize,
      width: iconSize,
    );
  }
}

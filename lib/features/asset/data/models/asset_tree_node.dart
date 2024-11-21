class AssetTreeNode {
  dynamic object;
  List<AssetTreeNode> children;

  AssetTreeNode(
    this.object,
  ) : children = [];

  void addChild(AssetTreeNode child) {
    children.add(child);
  }
}

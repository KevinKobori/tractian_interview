class TreeNode {
  dynamic object;
  List<TreeNode> children;

  TreeNode(
    this.object,
  ) : children = [];

  void addChild(TreeNode child) {
    children.add(child);
  }
}

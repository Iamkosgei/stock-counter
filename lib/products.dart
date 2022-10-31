class TreeNode<T> {
  TreeNode({
    required this.name,
    required this.stockLevel,
    required this.requiredSpec,
  });
  String name;
  int stockLevel;

  //Specification required to build the parent e.g 2 wheels to build a parent node
  int? requiredSpec;

  List<TreeNode<T>> children = [];

  void add(TreeNode<T> child) {
    children.add(child);
  }

  int computeStock(TreeNode root) {
    // if root has no children then it's a part(leaf node) thus get the stock level
    if (root.children.isNotEmpty) {
      //Set the intial mimimum stock level to the max int value
      int minimumStockAtLevel = 9223372036854775807;

      for (final child in root.children) {
        //Get the stock level of a part then do an integer division with the specs to get the newPartStock.
        // E.g if there are 40 wheels and a bike needs 2 then the newPartStock will be 40 divided by 2
        int newPartStock = computeStock(child) ~/ (child.requiredSpec ?? 1);

        // Set the minimumStockAtLevel as the minimum stock level in the particular level
        // E.g In the wheel example when frame has a stock level of 2 and tube 1 and both with specs of 1,
        // so this means we go with the lowest since you can't build a wheel wih less frames.

        if (newPartStock < minimumStockAtLevel) {
          minimumStockAtLevel = newPartStock;
        }
      }
      root.stockLevel = minimumStockAtLevel;
    }
    //Return the stock level of a leaf node
    return root.stockLevel;
  }

  @override
  String toString() {
    return "Name $name\tstockLevel$stockLevel\trequiredSpec\t$requiredSpec ";
  }
}

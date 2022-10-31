import 'package:products/products.dart';
import 'package:test/test.dart';

TreeNode<dynamic> createBikeInventory() {
  //create inventory
  final bike = TreeNode(name: 'bike', stockLevel: 0, requiredSpec: null);

  final seat = TreeNode(name: 'Seat', stockLevel: 50, requiredSpec: 1);
  final pedals = TreeNode(name: 'Pedals', stockLevel: 60, requiredSpec: 2);
  final wheel = TreeNode(name: 'wheel', stockLevel: 0, requiredSpec: 2);

  //add wheels
  final frame = TreeNode(name: 'frame', stockLevel: 60, requiredSpec: 1);
  final tube = TreeNode(name: 'tube', stockLevel: 35, requiredSpec: 1);

  wheel.add(frame);
  wheel.add(tube);

  //add to bike
  bike.add(seat);
  bike.add(wheel);
  bike.add(pedals);

  return bike;
}

TreeNode<dynamic> createTableInventory() {
  //create inventory
  final table = TreeNode(name: 'Desk', stockLevel: 0, requiredSpec: null);

  final leg = TreeNode(name: 'leg', stockLevel: 50, requiredSpec: 4);
  final top = TreeNode(name: 'top', stockLevel: 60, requiredSpec: 1);

  table.add(leg);
  table.add(top);

  return table;
}

TreeNode<dynamic> createTableInventoryWithLegHavingNoStock() {
  //create inventory
  final table = TreeNode(name: 'Desk', stockLevel: 5, requiredSpec: null);

  final leg = TreeNode(name: 'leg', stockLevel: 0, requiredSpec: 4);
  final top = TreeNode(name: 'top', stockLevel: 60, requiredSpec: 1);

  table.add(leg);
  table.add(top);

  return table;
}

void main() {
  test('Bike inventory should return correct inventory level {17}', () {
    final bikeInventory = createBikeInventory();

    int stockCount = bikeInventory.computeStock(bikeInventory);

    expect(stockCount, 17);
  });

  test('Table inventory should return correct inventory level {12}', () {
    final tableInventory = createTableInventory();

    int stockCount = tableInventory.computeStock(tableInventory);

    expect(stockCount, 12);
  });

  test('Table inventory should return correct inventory level {0}', () {
    final tableInventory = createTableInventoryWithLegHavingNoStock();

    int stockCount = tableInventory.computeStock(tableInventory);

    expect(stockCount, 0);
  });
}

## Stock counter

A program to computes the maximum number of finished bundles one can build from a collection of bundles and parts.

### Requirements

- Dart installed and configured - https://dart.dev/get-dart
- Clone the project and install dependencies.

#### Solution

This problem can be represented by a tree structure as shown below;

<img src="https://user-images.githubusercontent.com/14147462/198987571-5c9e3778-0dd5-44ea-a024-382c834bb5ba.png" width="600" />

Where leaf nodes (P9, P12, P1i, P6 and P7) are parts required to build their parents(bundles). These parts contain inventory levels.

#### Node properties;

1. **name** - Represents the name of the part or bundle e.g wheel or frame
2. **stockLevel** - The number of items available in stock, can be 0 for bundles.
3. **requiredSpec** - Specification to build the parent bundle e.g 2 wheels to build a bike;
4. **children** - A list of child nodes, can be null for leaf nodes, this is empty for parts and present in bundles.

<img src="https://user-images.githubusercontent.com/14147462/198999014-e8b9fbb9-3f43-4dbe-bfbc-8b3b7a3fa470.png" width="600" />

#### Creating inventory

<img src="https://user-images.githubusercontent.com/14147462/198998996-3212a4fc-0951-4ff4-baef-0ab908d10152.png" width="600" />

### Sample test

<img src="https://user-images.githubusercontent.com/14147462/199000086-253bb5bd-a795-4b1e-b837-4a76a7d6c20c.png" width="600" />

More tests cases can be found in the `test/products_test.dart` directory
`cd` to project root directory and run `dart test`

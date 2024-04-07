// import 'package:flutter/material.dart';

// void main() => runApp(const ExpansionAppTest());

// class ExpansionAppTest extends StatelessWidget {
//   const ExpansionAppTest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(useMaterial3: true),
//       home: SafeArea(
//         child: Scaffold(
//           body: const ExpansionTest(),
//         ),
//       ),
//     );
//   }
// }

// // stores ExpansionPanel state information
// class Item {
//   Item({
//     required this.expandedContent,
//     required this.notExpandContent,
//     this.isExpand = false,
//   });

//   String expandedContent;
//   String notExpandContent;
//   bool isExpand;
// }

// List<Item> expantionItems(int numberOfItems) {
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       notExpandContent: 'شماره $index',
//       expandedContent: 'number $index',
//     );
//   });
// }

// class ExpansionTest extends StatefulWidget {
//   const ExpansionTest({super.key});

//   @override
//   State<ExpansionTest> createState() => _ExpansionTestState();
// }

// class _ExpansionTestState extends State<ExpansionTest> {
//   final List<Item> items = expantionItems(3);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: _buildPanel(),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpan) {
//         setState(() {
//           items[index].isExpand = isExpan;
//         });
//       },
//       children: items.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpan) {
//             return ListTile(
//               title: Text(item.notExpandContent),
//             );
//           },
//           body: Text('کپشن'),
//           isExpanded: item.isExpand,
//         );
//       }).toList(),
//     );
//   }
// }

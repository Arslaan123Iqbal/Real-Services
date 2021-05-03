// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:real_services/provider%20model/dispatch_enventory_provider.dart';

// class DispatchInventoryTable extends StatefulWidget {
//   @override
//   _DispatchInventoryTableState createState() => _DispatchInventoryTableState();
// }

// class _DispatchInventoryTableState extends State<DispatchInventoryTable> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(""),
//       ),
//       body: Consumer<InventoryDispatchProvider>(
//         builder: (context, modelcustomer, _)=> FutureBuilder(builder: ()) {
//           return DataTable(
//             columns: [
//               DataColumn(label: Text("Id")),
//               DataColumn(label: Text("slug")),
//               DataColumn(label: Text("qty")),
//             ],
//             rows: [
//               DataRow(cells: [
//                 DataCell(Text(modelcustomer.dispatchInventorylist)),
//                 DataCell(Text("1")),
//                 DataCell(Text("1")),
//               ])
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

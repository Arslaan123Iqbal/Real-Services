// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:real_services/provider%20model/brand_model_provider.dart';
// import 'package:real_services/update_screens/update_brand.dart';

// class ShowBrand extends StatefulWidget {
//   @override
//   _ShowBrandState createState() => _ShowBrandState();
// }

// class _ShowBrandState extends State<ShowBrand> {
//   var refreshKey = GlobalKey<RefreshIndicatorState>();
//   Future<Null> refreshList() async {
//     refreshKey.currentState?.show();
//     await Future.delayed(Duration(seconds: 1));

//     setState(() {
//       Provider.of<BrandProvider>(context, listen: false).brandlist.toString();
//     });

//     return null;
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     Provider.of<BrandProvider>(context, listen: false).fetchData();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xffbfb28f),
//         title: Text("Brands"),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_sharp),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Container(
//         //main column
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 40,
//             ),
//             // Title Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   decoration:
//                       BoxDecoration(border: Border.all(color: Colors.black)),
//                   child: Container(
//                     height: MediaQuery.of(context).size.width * 0.1,
//                     width: MediaQuery.of(context).size.width * 0.2,
//                     color: Color(0xffbfb28f),
//                     child: Center(child: Text("Sr No")),
//                   ),
//                 ),
//                 Container(
//                   decoration:
//                       BoxDecoration(border: Border.all(color: Colors.black)),
//                   child: Container(
//                     height: MediaQuery.of(context).size.width * 0.1,
//                     width: MediaQuery.of(context).size.width * 0.3,
//                     color: Color(0xffbfb28f),
//                     child: Center(child: Text("Brand Name")),
//                   ),
//                 ),
//                 Container(
//                   decoration:
//                       BoxDecoration(border: Border.all(color: Colors.black)),
//                   child: Container(
//                     height: MediaQuery.of(context).size.width * 0.1,
//                     width: MediaQuery.of(context).size.width * 0.2,
//                     color: Color(0xffbfb28f),
//                     child: Center(child: Text("Action")),
//                   ),
//                 )
//               ],
//             ),
//             // List view row
//             Expanded(
//               child: Consumer<BrandProvider>(
//                   builder: (context, model, _) => FutureBuilder(
//                       future: model.fetchData(),
//                       builder: (context, snapshot) {
//                         return RefreshIndicator(
//                           key: refreshKey,
//                           child: ListView.builder(
//                               itemCount: model.brandlist.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                           border:
//                                               Border.all(color: Colors.black)),
//                                       child: Container(
//                                         height:
//                                             MediaQuery.of(context).size.width *
//                                                 0.1,
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.2,
//                                         color: Color(0xffbfb28f),
//                                         child: Center(
//                                             child: Text(model.brandlist[index]
//                                                     ["id"]
//                                                 .toString())),
//                                       ),
//                                     ),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                           border:
//                                               Border.all(color: Colors.black)),
//                                       child: Container(
//                                         height:
//                                             MediaQuery.of(context).size.width *
//                                                 0.1,
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.2,
//                                         color: Color(0xffbfb28f),
//                                         child: Center(
//                                             child: Text(model.brandlist[index]
//                                                 ["name"])),
//                                       ),
//                                     ),
//                                     RaisedButton(
//                                       onPressed: () {
//                                         // // print(model.brandlist[index]['id']);
//                                         model.DelData(model.brandlist[index]
//                                                 ['id']
//                                             .toString());
//                                         // print(model.brandlist[index]['id']
//                                         //     .runtimeType);
//                                       },
//                                       child: Text("Delete"),
//                                     ),
//                                     RaisedButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   updateBrandwidget(
//                                                       context,
//                                                       model.brandlist[index]
//                                                           ["id"],
//                                                       model.brandlist[index]
//                                                           ["name"])),
//                                         );
//                                         // // print(model.brandlist[index]['id']);
//                                         // updateBrandwidget(context,
//                                         //     model.brandlist[index]["id"]);
//                                         // print(model.brandlist[index]['id']
//                                         //     .runtimeType);
//                                       },
//                                       child: Text("Update"),
//                                     ),
//                                   ],
//                                 );
//                               }),
//                           onRefresh: refreshList,
//                         );
//                       })),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:amap_map_fluttify/amap_map_fluttify.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class MapChoicePoint extends StatefulWidget {
//   final Function(LatLng) onChoicePoint;
//
//   MapChoicePoint(this.onChoicePoint);
//
//   @override
//   _MapChoicePointState createState() => _MapChoicePointState();
// }
//
// class _MapChoicePointState extends State<MapChoicePoint> {
//   late AmapController _amapController;
//   late Marker _markerSelect;
//   late Marker _markerSearched;
//   late String city;
//   late TextEditingController _searchController;
//
//   Uri _imgUri = Uri.parse('images/position.png');
//
//   Future<bool> _requestPermission() async {
//     PermissionStatus status = await Permission.locationWhenInUse.status;
//     if (status == PermissionStatus.denied) {
//       status = await Permission.locationWhenInUse.request();
//       if (status == PermissionStatus.denied) {
//         return false;
//       }
//     }
//     return status == PermissionStatus.granted;
//   }
//
//   Future<void> _openModalBottomSheet() async {
//     FocusScope.of(context).requestFocus(FocusNode());
//
//     final poiList = await AmapSearch.searchKeyword(
//       _searchController.text,
//       city: city,
//     );
//     List<Map> points = [];
//
//     for (var item in poiList) {
//       points.add({
//         'title': await item.title,
//         'address': (await item.adName) ?? "${(await item.address) ?? ""}",
//         'position': await item.latLng,
//       });
//     }
//
//     // ignore: use_build_context_synchronously
//     final option = await showModalBottomSheet(
//         context: context,
//         builder: (BuildContext context) {
//           return points.isNotEmpty
//               ? ListView.builder(
//                   itemCount: points.length,
//                   itemBuilder: (BuildContext itemContext, int i) {
//                     return ListTile(
//                       title: Text(points[i]['title']),
//                       subtitle: Text(points[i]['address']),
//                       onTap: () {
//                         Navigator.pop(context, points[i]);
//                       },
//                     );
//                   },
//                 )
//               : Container(
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.all(40),
//                   child: const Text('暂无数据'));
//         });
//
//     if (option != null) {
//       LatLng selectLatLng = option['position'];
//       _amapController.setCenterCoordinate(
//           selectLatLng.latitude, selectLatLng.longitude);
//       if (_markerSearched != null) {
//         _markerSearched.remove();
//       }
//       _markerSearched = await _amapController.addMarker(MarkerOption(
//         latLng: selectLatLng,
//       ));
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _searchController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: AlignmentDirectional.topCenter,
//       children: <Widget>[
//         AmapView(
//           onMapCreated: (controller) async {
//             _amapController = controller;
//             if (await _requestPermission()) {
//               final location = await AmapLocation.fetchLocation();
//               city = await location.city;
//               await controller.showMyLocation(MyLocationOption(show: true));
//             }
//           },
//           onMapClicked: (LatLng coord) async {
//             if (_amapController != null) {
//               if (_markerSelect != null) {
//                 _markerSelect.remove();
//               }
//               if (_markerSearched != null) {
//                 _markerSearched.remove();
//               }
//               _markerSelect = await _amapController.addMarker(MarkerOption(
//                 latLng: coord,
//                 iconUri: _imgUri,
//                 imageConfig: createLocalImageConfiguration(context),
//                 width: 64,
//                 height: 64,
//                 anchorV: 0.7,
//                 anchorU: 0.5,
//               ));
//               widget.onChoicePoint(coord);
//             }
//           },
//         ),
//         Container(
//           margin: const EdgeInsets.all(20),
//           width: MediaQuery.of(context).size.width,
//           height: 46,
//           decoration: const BoxDecoration(color: Colors.white),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 width: MediaQuery.of(context).size.width - 20 - 80,
//                 child: TextField(
//                   controller: _searchController,
//                   decoration: const InputDecoration(border: InputBorder.none),
//                   inputFormatters: <TextInputFormatter>[
//                     LengthLimitingTextInputFormatter(10)
//                   ],
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.search),
//                 onPressed: _openModalBottomSheet,
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

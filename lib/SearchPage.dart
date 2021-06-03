//
// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Text("Hello World"),
//     );
//   }
//
//   void findPlace(String placeName) async {
//     if (placeName.length > 1) {
//       String autoCompleteURL =
//           "https://maps.googleapis.com/maps/api/place/autocomplete/output?parameters";
//     }
//   }
// }
//
// class MySearchPage extends StatefulWidget {
//   @override
//   _MySearchPageState createState() => _MySearchPageState();
// }
//
// class _MySearchPageState extends State<MySearchPage> {
//   final _destinationController = TextEditingController();
//   PlaceApi _placeApi = PlaceApi.instance;
//   bool searching = false;
//   List<Place> _predictions = [];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _destinationController.dispose();
//     super.dispose();
//   }
//
//   _inputOnChanged(String query) {
//     if (query.trim().length > 2) {
//       setState(() {
//         searching = true;
//       });
//       _search(query);
//     } else {
//       if (searching || _predictions.length > 0) {
//         setState(() {
//           searching = false;
//           _predictions = [];
//         });
//       }
//     }
//   }
//
//   _search(String query) {
//     _placeApi
//         .searchPredictions(query)
//         .asStream()
//         .listen((List<Place> predictions) {
//       if (Icons.batch_prediction_sharp != null) {
//         setState(() {
//           searching = false;
//           _predictions = predictions ?? [];
//           //  print('Resultados: ${predictions.length}');
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _appBar(),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: Column(
//           children: [
//             searching
//                 ? Expanded(
//                     child: Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   )
//                 : Expanded(
//                     child: ListView.builder(
//                         itemCount: _predictions.length,
//                         itemBuilder: (_, i) {
//                           final Place item = _predictions[i];
//                           return ListTile(
//                             title: Text(item.description),
//                             leading: Icon(Icons.location_on),
//                             onTap: () {
//                               print(item.description);
//                             },
//                           );
//                         }))
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _appBar() {
//     return AppBar(
//       title: Text(
//         "Search Location",
//         style: TextStyle(
//             fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
//       ),
//       backgroundColor: Colors.white,
//       leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           onPressed: () {}),
//       bottom: PreferredSize(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   AddressInput(
//                     controller: _destinationController,
//                     iconData: Icons.place_sharp,
//                     hintText: " Where are you going?",
//                     onChanged: this._inputOnChanged,
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//         preferredSize: Size.fromHeight(40),
//       ),
//     );
//   }
// }
//
// class AddressInput extends StatelessWidget {
//   final IconData iconData;
//   final TextEditingController controller;
//   final String hintText;
//   final Function onTap;
//   final bool enabled;
//   final void Function(String) onChanged;
//
//   const AddressInput({
//     Key key,
//     this.iconData,
//     this.controller,
//     this.hintText,
//     this.onTap,
//     this.enabled,
//     this.onChanged,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(
//           this.iconData,
//           size: 18,
//           color: Colors.black,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Container(
//             height: 35.0,
//             width: MediaQuery.of(context).size.width / 1.4,
//             alignment: Alignment.center,
//             padding: EdgeInsets.only(left: 10.0),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5.0),
//               color: Colors.grey[100],
//             ),
//             child: TextField(
//               controller: controller,
//               onChanged: onChanged,
//               onTap: onTap,
//               enabled: enabled,
//               decoration: InputDecoration.collapsed(
//                 hintText: hintText,
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

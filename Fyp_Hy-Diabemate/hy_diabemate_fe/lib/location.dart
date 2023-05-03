// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class LocationScreen extends StatefulWidget {
//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   Position? _currentPosition;
//   final Geolocator geolocator = Geolocator();

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   _getCurrentLocation() async {
//     await geolocator
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       setState(() {
//         _currentPosition = position;
//       });
//     }).catchError((e) {
//       print(e);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Demo'),
//       ),
//       body: Center(
//         child: _currentPosition == null
//             ? CircularProgressIndicator()
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'LATITUDE: ${_currentPosition!.latitude}',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'LONGITUDE: ${_currentPosition!.longitude}',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   RaisedButton(
//                     onPressed: () {
//                       _getAddressFromLatLng();
//                     },
//                     child: Text("Get Location"),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }

//   _getAddressFromLatLng() async {
//     try {
//       List<Placemark> placemarks = await geolocator.placemarkFromCoordinates(
//           _currentPosition!.latitude, _currentPosition!.longitude);

//       Placemark place = placemarks[0];

//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Current Location"),
//             content: Text(place.name +
//                 ", " +
//                 place.locality +
//                 ", " +
//                 place.postalCode +
//                 ", " +
//                 place.country),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text("OK"),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     } catch (e) {
//       print(e);
//     }
//   }
// }

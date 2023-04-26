// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<Profile> {
//   late String _name;
//   late int _age;

//   @override
//   void initState() {
//     super.initState();
//     final currentUser = FirebaseAuth.instance.currentUser;
//     _name = currentUser?.displayName ?? 'Unknown';
//     _age = currentUser?.metadata.creationTime?.year ?? DateTime.now().year;
//   }

//   void _updateProfile() {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     currentUser?.updateProfile(displayName: _name);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Profile updated')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentUser = FirebaseAuth.instance.currentUser;

//     return Scaffold(
//       backgroundColor: Color.fromARGB(57, 7, 204, 178),
//       appBar: AppBar(
//        backgroundColor: Color.fromARGB(255, 74, 102, 95),
//          leading: BackButton(
//            onPressed: () => Navigator.of(context).pop(),
//      color: Colors.white
//    ),
//          title: Text(
//           "Hy-Diabemate",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontFamily: "Satisfy",
//             fontSize: 35.0,
//           ),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.person, size: 200.0),
//             const SizedBox(height: 20.0),
//             Text(
//               'Email: ${currentUser?.email ?? 'Unknown'}',
//               style: TextStyle(
//     fontSize: 20.0,
//     color: Colors.white,
//   ),
//             ),
//             const SizedBox(height: 20.0),
//             SizedBox( // <-- SEE HERE
//   width: 350,
//            child: TextFormField(
//               initialValue: _name,
//               decoration:  InputDecoration(
//                 labelText: 'Name',
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//           width: 3, color: Colors.greenAccent),
//         borderRadius: BorderRadius.circular(32.0),

//       ),
//                 labelStyle: TextStyle(
//       color: Colors.white,
//     ),
//               ),
//               style: TextStyle(
//                     color: Colors.white,
//                   ),
//               onChanged: (value) {
//                 setState(() {
//                   _name = value;
//                 });
//               },
//             ),
//             ),
//             const SizedBox(height: 20.0),
//             SizedBox( // <-- SEE HERE
//   width: 350,
//           child:  TextFormField(
//               initialValue: _age.toString(),
//               keyboardType: TextInputType.number,

//               decoration:  InputDecoration(
//                 labelText: 'Age',
//                enabledBorder: OutlineInputBorder(
//                  borderSide: BorderSide(
//           width: 3, color: Colors.greenAccent),
//         borderRadius: BorderRadius.circular(32.0)
//       ),

//                 labelStyle: TextStyle(
//       color: Colors.white,
//     ),
//               ),
//               style: TextStyle(
//                     color: Colors.white,
//                   ),
//               onChanged: (value) {
//                 setState(() {
//                   _age = int.parse(value);
//                 });
//               },
//             ),
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//     primary: Colors.greenAccent, // Background color
//   ),
//               onPressed: _updateProfile,
//               child: const Text('Update Profile'),
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//     primary: Colors.greenAccent, // Background color
//   ),
//               onPressed: () {
//                 FirebaseAuth.instance.signOut();
//                 Navigator.of(context).popUntil((route) => route.isFirst);
//               },
//               child: const Text('Log Out'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hy_diabemate_fe/History_page.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Profile>
    with SingleTickerProviderStateMixin {
  late String _name;
  late int _age;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser;
    _name = currentUser?.displayName ?? 'Unknown';
    _age = currentUser?.metadata.creationTime?.year ?? DateTime.now().year;
    _tabController = TabController(length: 2, vsync: this);
  }

  void _updateProfile() {
    final currentUser = FirebaseAuth.instance.currentUser;
    currentUser?.updateProfile(displayName: _name);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromARGB(57, 7, 204, 178),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 74, 102, 95),
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.white,
          ),
          title: Text(
            "Hy-Diabemate",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Satisfy",
              fontSize: 35.0,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: 'Profile',
              ),
              Tab(
                text: 'History',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person, size: 200.0),
                  const SizedBox(height: 20.0),
                  Text(
                    'Email: ${currentUser?.email ?? 'Unknown'}',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      initialValue: _name,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _name = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      initialValue: _age.toString(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _age = int.parse(value);
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent, // Background color
                    ),
                    onPressed: _updateProfile,
                    child: const Text('Update Profile'),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent, // Background color
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: const Text('Log Out'),
                  ),
                ],
              ),
            ),
Container(
  padding: EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Prediction History',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 16),
      Text(
        'Status: Positive and Negative',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 16),
      DataTable(
        columns: [
          DataColumn(
            label: Text('Date', style: TextStyle(color: Colors.white)),
          ),
          DataColumn(
            label: Text('Status', style: TextStyle(color: Colors.white)),
          ),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('2022-01-01', style: TextStyle(color: Colors.white))),
            DataCell(
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  SizedBox(width: 8),
                  Text('Positive', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ]),
          DataRow(cells: [
            DataCell(Text('2022-01-02', style: TextStyle(color: Colors.white))),
            DataCell(
              Row(
                children: [
                  Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                  SizedBox(width: 8),
                  Text('Negative', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ]),
          // Add more rows for additional history data
        ],
      ),
    ],
  ),
)


            // Center(
            //   child: Text(
            //     'History',
            //     style: TextStyle(
            //       fontSize: 30.0,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

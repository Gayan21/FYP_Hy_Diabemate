import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String prediction;

  Profile({required this.prediction});

  // const Profile({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Profile>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> _historyData = [];
  late String _name;
  late int _age;
  late TabController _tabController;
  //  String prediction='';

  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser;
    _name = currentUser?.displayName ?? 'Unknown';
    _age = currentUser?.metadata.creationTime?.year ?? DateTime.now().year;
    _tabController = TabController(length: 2, vsync: this);
    _addHistoryData(DateTime.now(), true);
    // prediction = '1';
  }

  void _updateProfile() {
    final currentUser = FirebaseAuth.instance.currentUser;
    currentUser?.updateProfile(displayName: _name);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated')),
    );
  }

  void _addHistoryData(DateTime dateTime, bool isPositive) {
    Map<String, dynamic> newData = {
      'dateTime': dateTime,
      'isPositive': isPositive,
    };
    setState(() {
      _historyData.add(newData);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromARGB(57, 7, 204, 178),
        appBar: AppBar(
          centerTitle: true,
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
                  const Icon(Icons.person, size: 200.0, color: Colors.white),
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
                    width: 300,
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
                    width: 300,
                    child: TextFormField(
                      initialValue: _age.toString(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Year',
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
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ), // Background color
                    ),
                    onPressed: _updateProfile,
                    child: const Text(
                      'Update Profile',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ), // Background color
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
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
                  Card(
                    color: Colors.black,
                    margin: EdgeInsets.all(8),
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Test Results',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          Table(
                            border: TableBorder.all(color: Colors.black),
                            columnWidths: {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      'Prediction',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: RichText(
                                      text: TextSpan(
                                        text:
                                            '${widget.prediction == '1' ? 'Type 1 diabetes' : widget.prediction == '2' ? 'Positive' : 'Negative'}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Castoro Titling',
                                          fontSize: 15.0,
                                          color: widget.prediction == '1'
                                              ? Colors.red
                                              : widget.prediction == '2'
                                                  ? Colors.yellow
                                                  : Color.fromARGB(
                                                      255, 2, 104, 6),
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '\nDate & time: ${DateTime.now().toString()}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.0,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

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

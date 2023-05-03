import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> _historyData = [];

  @override
  void initState() {
    super.initState();
    // Initialize history data with a single entry for the current date/time
    _addHistoryData(DateTime.now(), true);
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction History'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Prediction History',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Card(
              color: Colors.grey[200],
              margin: EdgeInsets.all(8),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text('Date',
                          style: TextStyle(color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Status',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                  rows: _historyData
                      .map((data) => DataRow(cells: [
                            DataCell(Text(
                                '${data['dateTime'].toString()}',
                                style: TextStyle(color: Colors.black))),
                            DataCell(
                              Row(
                                children: [
                                  Icon(
                                    data['isPositive']
                                        ? Icons.check_circle
                                        : Icons.cancel,
                                    color: data['isPositive']
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                      data['isPositive']
                                          ? 'Positive'
                                          : 'Negative',
                                      style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                          ]))
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add a new entry to the history with the current date/time
                _addHistoryData(DateTime.now(), true);
              },
              child: Text('Add New Entry'),
            ),
          ],
        ),
      ),
    );
  }
}

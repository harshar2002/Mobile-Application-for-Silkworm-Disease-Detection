import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:silkworm/models/circularIndicator.dart';
import 'package:silkworm/models/connect.dart';

class Monitoring extends StatefulWidget {
  const Monitoring({super.key});

  @override
  State<Monitoring> createState() => _MonitoringState();
}

class _MonitoringState extends State<Monitoring> {
  late Future<Map<String, dynamic>> _futuredata;

  @override
  void initState() {
    super.initState();
    _futuredata = Connect().getData();
    _refresh();
  }

  Future<void> _refresh() async {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        _futuredata = Connect().getData();
      });
    });
  }

  List<String> keys = ['Light', 'Humidity', 'Temperature'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitor'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<Map<String, dynamic>>(
          future: _futuredata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                //padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 15.0),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  String value = (snapshot.data!.entries.elementAt(index).key ==
                          'Light')
                      ? (' lux')
                      : ((snapshot.data!.entries.elementAt(index).key == 'Hum')
                          ? ('%')
                          : ('°C'));

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(25.0, 15.0, 15.0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              keys.elementAt(index),
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Stack(alignment: Alignment.center, children: [
                              CircularIndicator(
                                value: double.parse(snapshot.data!.entries
                                    .elementAt(index)
                                    .value
                                    .toString()),
                                value2: (double.parse(snapshot.data!.entries
                                            .elementAt(index)
                                            .value
                                            .toString()) <=
                                        100)
                                    ? 100
                                    : 10000,
                              ),
                              Text(
                                '${double.parse(snapshot.data!.entries.elementAt(index).value.toString()).round()}$value',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ]),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

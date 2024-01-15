import 'package:flutter/material.dart';
import "dart:async";
import "package:http/http.dart" as http;
import "dart:convert";

import 'package:ramadhan_app/Data.dart';

class PrayerTimes extends StatefulWidget {
  const PrayerTimes({super.key});

  @override
  State<PrayerTimes> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrayerData();
  }

  TextEditingController place = TextEditingController();

  late Data list;

  final String url =
      'http://api.aladhan.com/v1/timingsByCity/15-01-2024?city=Selangor&country=Malaysia&method=11';

  Future getPrayerData() async {
    http.Response response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    list = Data.fromJson(data);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prayer Times',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder(
        future: getPrayerData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Column(
                      children: <Widget>[
                        Text(
                          'Imsak',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          'Subuh',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          'Zuhur',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          'Asar',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          'Maghrib',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          'Isya',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          snapshot.data!.data.timings.imsak,
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          snapshot.data!.data.timings.fajr,
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          snapshot.data!.data.timings.dhuhr,
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          snapshot.data!.data.timings.asr,
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          snapshot.data!.data.timings.maghrib,
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          snapshot.data!.data.timings.isha,
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'), // Display error message
            );
          } else {
            return Center(
                child: CircularProgressIndicator()); // Show loading indicator
          }
        },
      ),
    );
  }
}

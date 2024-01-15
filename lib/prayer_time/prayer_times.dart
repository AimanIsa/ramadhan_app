import "dart:convert";

import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import "dart:async";
import "package:http/http.dart" as http;
import "package:intl/intl.dart"; // Import for date formatting
import "package:ramadhan_app/color.dart";

import "package:ramadhan_app/prayer_time/Data.dart";

class PrayerTimes extends StatefulWidget {
  const PrayerTimes({super.key});

  @override
  State<PrayerTimes> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  String selectedPlace = "Selangor";
  DateTime currentDate = DateTime.now();

  TextEditingController place = TextEditingController();

  late Data list;

  Future getPrayerData() async {
    String formattedDate = DateFormat("yyyy-MM-dd").format(currentDate);
    String url =
        'http://api.aladhan.com/v1/timingsByCity/$formattedDate?city=$selectedPlace&country=Malaysia&method=11';

    http.Response response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    list = Data.fromJson(data);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkgreen,
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          "Prayer Times", // Display current date in title
          style: GoogleFonts.poppins(color: cream),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getPrayerData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(height: 20),
                Text(
                  " for ${DateFormat("MMMM d, yyyy").format(currentDate)}",
                  style: TextStyle(color: cream),
                ),
                SizedBox(height: 20),
                Card(
                  color: cream,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DropdownButton<String>(
                      value: selectedPlace,
                      icon: const Icon(Icons.arrow_drop_down_circle),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: cream),
                      focusColor: cream,
                      iconEnabledColor: darkgreen,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPlace = newValue!;
                          getPrayerData(); // Refresh data when place changes
                        });
                      },
                      items: <String>[
                        'Selangor',
                        'Kuala Lumpur',
                        'Putrajaya',
                        'Perak',
                        'Pahang',
                        'Johor Bahru'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: darkgreen),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Imsak',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: cream,
                                  ),
                                ),
                                Text(
                                  'Subuh',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: cream,
                                  ),
                                ),
                                Text(
                                  'Zuhur',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: cream,
                                  ),
                                ),
                                Text(
                                  'Asar',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: cream,
                                  ),
                                ),
                                Text(
                                  'Maghrib',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: cream,
                                  ),
                                ),
                                Text(
                                  'Isya',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: cream,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  snapshot.data!.data.timings.imsak,
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: cream,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.data.timings.fajr,
                                  // ... (Previous code remains the same)
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: cream,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.data.timings.dhuhr,
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: cream,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.data.timings.asr,
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: cream,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.data.timings.maghrib,
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: cream,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.data.timings.isha,
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: cream,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

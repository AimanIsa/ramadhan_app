import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramadhan_app/color.dart';

class info extends StatelessWidget {
  const info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkgreen,
        appBar: AppBar(
          backgroundColor: green,
          title: Text(
            "Info Apps",
            style: GoogleFonts.poppins(color: cream),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: lightgreen,
                  child: const Padding(
                    padding: EdgeInsets.all(30),
                    child: Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Objective"),
                            Text(
                                "1. To Improve Spiritual Growth and Observance During The Holy Month of Ramadhan"),
                            Text(
                                "2. To Increase Accessability and Knowledge based on The Teachings of Islam"),
                            Text(
                                "3. To Provide Supports For The User To Have a Meaningful and Fulfilling Ramadhan Experiences"),
                          ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: lightgreen,
                  child: const Padding(
                    padding: EdgeInsets.all(30),
                    child: Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Summary"),
                            Text(
                                "The Ramadhan Application integrates with a lot of functionalities, including a dynamic live countdown timer for Ramadan, an interactive ramadhan checklist, real-time prayer time updates and quranic text. We hope that the application can be a useful and significant tools for user to enhance and organize their Ramadan observance as well as gaining more Ramadan related knowledge so that it can help others in observing Ramadan in a meaningful way."),
                          ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

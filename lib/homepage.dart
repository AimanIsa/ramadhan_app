import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramadhan_app/Quran/quranpage.dart';
import 'package:ramadhan_app/checklist/checklist.dart';
import 'package:ramadhan_app/color.dart';
import 'package:ramadhan_app/groupmember/groupmember.dart';
import 'package:ramadhan_app/prayer_time/prayer_times.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkgreen,
      appBar: AppBar(
        backgroundColor: green,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: green,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(80.0),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.10,
            width: double.infinity,
            child: Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Ramadhan',
                        style: TextStyle(
                            color: cream,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      Text('Be a better Muslim',
                          style: GoogleFonts.dancingScript(color: cream)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
          Card(
            color: lightgreen,
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => PrayerTimes()),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage('lib/images/prayer.png'),
                        width: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Prayer Time ",
                        style: GoogleFonts.poppins(
                            color: darkgreen,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                color: lightgreen,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => QuranPage()),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        const Image(
                          image: AssetImage('lib/images/quran.png'),
                          width: 100,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Quran",
                          style: GoogleFonts.poppins(
                              color: darkgreen,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                color: lightgreen,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => checklist()),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('lib/images/checklist.png'),
                          width: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Checklist",
                          style: GoogleFonts.poppins(
                              color: darkgreen,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 90),
          const Column(
            children: [
              Text(
                "@copyright Group3_MAD_2024",
                style: TextStyle(color: Colors.white30),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: green,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(80.0),
            topRight: Radius.circular(80.0),
          ),
        ),
        height: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: lightgreen),
                    onPressed: () {},
                    child: Icon(
                      Icons.info,
                      color: darkgreen,
                    )),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: lightgreen),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => GroupMember()),
                      );
                    },
                    child: Icon(
                      Icons.people,
                      color: darkgreen,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

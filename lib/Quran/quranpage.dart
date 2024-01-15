import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:ramadhan_app/Quran/selectedsurah.dart';
import 'package:ramadhan_app/color.dart';

// ignore: must_be_immutable
class QuranPage extends StatefulWidget {
  QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkgreen,
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          "Surah",
          style: GoogleFonts.poppins(color: cream),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final surahNumber = index + 1; // Start from 1
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectedSurah(
                          surahNumber:
                              surahNumber), // Pass surahNumber to VersesPage
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    color: green.withOpacity(0),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            quran.getSurahName(surahNumber),
                            style: TextStyle(color: cream),
                          ),
                          SizedBox(width: 10),
                          Text(
                            quran.getSurahNameEnglish(surahNumber),
                            style: TextStyle(color: cream, fontSize: 12),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        quran.getSurahNameArabic(surahNumber),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.amiri(color: cream),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

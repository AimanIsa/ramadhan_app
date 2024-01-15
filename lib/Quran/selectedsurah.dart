import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:ramadhan_app/constant.dart';

class SelectedSurah extends StatelessWidget {
  const SelectedSurah({super.key, required this.surahNumber});

  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkgreen,
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          quran.getSurahName(surahNumber),
          style: TextStyle(color: cream),
        ), // Use surahNumber for app bar title
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: quran
              .getVerseCount(surahNumber), // Use surahNumber for verse count
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  quran.getVerse(surahNumber, index + 1,
                      verseEndSymbol:
                          true), // Use surahNumber for verse retrieval
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 29),
                    Text(
                      quran.getVerseTranslation(
                        surahNumber,
                        index + 1,
                        verseEndSymbol: false,
                        translation: quran.Translation
                            .enSaheeh, // Specify the desired translation
                      ),
                      style: TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

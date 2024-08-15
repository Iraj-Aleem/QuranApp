import 'dart:math';
import 'package:quran/quran.dart' as quran;
import 'package:flutter/material.dart';
class RandomVerse {
  late  String  verse;
  late  int surahNumber;
  late  int verseNumber;

  RandomVerse() {
    _generateRandomVerse();
  }

  void _generateRandomVerse() {
    final random = Random();
    
    // Generate a random verse index (1 to 6236)
    int randomVerseIndex = random.nextInt(6236) + 1;
    
    // Calculate the corresponding Surah and verse number
    int cumulativeVerseCount = 0;
    for (int i = 1; i <= 114; i++) {
      int verseCountInSurah = quran.getVerseCount(i);
      if (cumulativeVerseCount + verseCountInSurah >= randomVerseIndex) {
        surahNumber = i;
        verseNumber = randomVerseIndex - cumulativeVerseCount;
        break;
      }
      cumulativeVerseCount += verseCountInSurah;
    }
    
    // Get the verse text
    verse = quran.getVerse(surahNumber, verseNumber);
  }

  String getVerseDetails() {
    return 'Surah: ${quran.getSurahName(surahNumber)}\nVerse: $verseNumber\nText: $verse';
  }
}
class RandomVerseScreen extends StatefulWidget {
  @override
    const  RandomVerseScreen({super.key});
  _RandomVerseScreenState createState() => _RandomVerseScreenState();
}

class _RandomVerseScreenState extends State<RandomVerseScreen> {
  late RandomVerse randomVerse;

  @override
  void initState() {
    super.initState();
    randomVerse = RandomVerse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Quran Verse'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              randomVerse.getVerseDetails(),
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:surah_munjiat_v2/Constant/color.dart';
import 'package:surah_munjiat_v2/Widget/pdf_view.dart';

class SurahPage extends StatefulWidget {
  final String title, path, subText;
  const SurahPage(
      {super.key,
      required this.title,
      required this.path,
      required this.subText});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: PDFViewer(path: widget.path),
          ),
          Expanded(
            flex: 1,
            child: Card(
              margin: EdgeInsets.all(2.1.w),
              color: secondaryColor,
              child: Container(
                padding: EdgeInsets.all(2.1.w),
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Fadhilat ${widget.title}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.subText, textAlign: TextAlign.center)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

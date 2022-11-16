import 'package:flutter/material.dart';
import 'package:surah_munjiat_v2/Widget/pdf_view.dart';

class MathuratPage extends StatefulWidget {
  final String title, path, subText;
  const MathuratPage(
      {super.key,
      required this.title,
      required this.path,
      required this.subText});

  @override
  State<MathuratPage> createState() => _MathuratPageState();
}

class _MathuratPageState extends State<MathuratPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PDFViewer(path: widget.path),
          ),
        ],
      ),
    );
  }
}

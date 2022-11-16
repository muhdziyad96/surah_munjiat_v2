import 'package:flutter/material.dart';
import 'package:surah_munjiat_v2/Widget/pdf_view.dart';

class DoaHadisPage extends StatefulWidget {
  final String title, path;
  const DoaHadisPage({
    super.key,
    required this.title,
    required this.path,
  });

  @override
  State<DoaHadisPage> createState() => _DoaHadisPageState();
}

class _DoaHadisPageState extends State<DoaHadisPage> {
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

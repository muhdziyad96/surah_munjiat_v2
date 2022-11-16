import 'package:flutter/material.dart';
import 'package:surah_munjiat_v2/Widget/pdf_view.dart';

class MunjiatPage extends StatefulWidget {
  final String title, path;
  const MunjiatPage({
    super.key,
    required this.title,
    required this.path,
  });

  @override
  State<MunjiatPage> createState() => _MunjiatPageState();
}

class _MunjiatPageState extends State<MunjiatPage> {
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

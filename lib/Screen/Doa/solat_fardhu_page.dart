import 'package:flutter/material.dart';
import 'package:surah_munjiat_v2/Widget/pdf_view.dart';

class SolatFardhuPage extends StatefulWidget {
  final String title, path;
  const SolatFardhuPage({
    super.key,
    required this.title,
    required this.path,
  });

  @override
  State<SolatFardhuPage> createState() => _SolatFardhuPageState();
}

class _SolatFardhuPageState extends State<SolatFardhuPage> {
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

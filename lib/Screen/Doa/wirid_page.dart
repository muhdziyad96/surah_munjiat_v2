import 'package:flutter/material.dart';
import 'package:surah_munjiat_v2/Widget/pdf_view.dart';

class WiridPage extends StatefulWidget {
  final String title, path;
  const WiridPage({
    super.key,
    required this.title,
    required this.path,
  });

  @override
  State<WiridPage> createState() => _WiridPageState();
}

class _WiridPageState extends State<WiridPage> {
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

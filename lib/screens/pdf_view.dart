import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewScreen extends StatelessWidget{
  const PDFViewScreen(this.url,{super.key});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.network(url),
    );
  }
}
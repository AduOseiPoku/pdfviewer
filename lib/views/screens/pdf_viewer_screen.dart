import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerScreen extends StatelessWidget {
  final String filePath;

  const PdfViewerScreen({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    final pdfController = PdfControllerPinch(
      document: PdfDocument.openFile(filePath),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('PDF Viewer')),
      body: PdfViewPinch(controller: pdfController),
    );
  }
}

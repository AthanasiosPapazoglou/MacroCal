import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  bool _hasResult = false;

  void _onDetect(BarcodeCapture capture) {
    final String? barcode = capture.barcodes.firstOrNull?.rawValue;
    if (_hasResult || barcode == null || barcode.isEmpty) return;
    _hasResult = true;
    Navigator.pop(context, barcode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(onDetect: _onDetect),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close Scanner'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

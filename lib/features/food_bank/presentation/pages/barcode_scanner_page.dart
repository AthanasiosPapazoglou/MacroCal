import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerPage extends StatefulWidget {
  const new({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  bool _hasResult = false;

  void _onDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.firstOrNull?.rawValue;
    if (_hasResult || barcode == null || barcode.isEmpty) return;
    _hasResult = true;
    context.pop(barcode);
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
                onPressed: () => context.pop(),
                child: Text(context.l10n.scannerPageClose),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QrScannerScreen extends ConsumerStatefulWidget {
  const QrScannerScreen({super.key});

  @override
  ConsumerState<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends ConsumerState<QrScannerScreen> {
  bool _isScanning = false;
  bool _isValidating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('scan_qr'.tr()),
      ),
      body: Stack(
        children: [
          // Mock QR Scanner View
          Container(
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Center(
                      child: _isScanning
                          ? const CircularProgressIndicator()
                          : Icon(Icons.qr_code, size: 100, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _isScanning ? 'scanning'.tr() : 'ready_to_scan'.tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          if (_isValidating) const Center(child: CircularProgressIndicator()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isScanning ? null : _startScan,
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Future<void> _startScan() async {
    setState(() => _isScanning = true);

    // Mock scan delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isScanning = false;
      _isValidating = true;
    });

    // Mock validation delay
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isValidating = false);

    // Show result
    _showScanResult();
  }

  void _showScanResult() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('scan_result'.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 48),
            const SizedBox(height: 16),
            Text('valid_ticket'.tr()),
            const SizedBox(height: 8),
            Text('user_name'.tr(args: ['John Doe'])),
            Text('valid_until'.tr(args: ['14:30'])),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('done'.tr()),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/default_app_bar.dart';

class QRCodeScannerScreen extends StatefulWidget {
  static const routeName = '/QRCodeScanner';

  @override
  _QRCodeScannerScreenState createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  late Barcode result;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
                  child: Column(
            children: [
              DefaultAppBar(
                hasNotificationButton: false,
              ),
              Expanded(
                child: _buildQrView(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = 300.h;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10.h,
          borderLength: 30.w,
          borderWidth: 10.h,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      // print(scanData.code);
      controller.pauseCamera();
      Navigator.pop(context, scanData.code);
    });
  }
}

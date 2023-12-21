// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class QrScanAr extends StatefulWidget {
  const QrScanAr({super.key});

  @override
  _QrScanArState createState() => _QrScanArState();
}

class _QrScanArState extends State<QrScanAr> {
  final GlobalKey _qrKey = GlobalKey();
  late QRViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QR Code Scanner',
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontFamily: 'antique',
            color: Colors.brown,
            fontSize: 33,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: QRView(
        key: _qrKey,
        // make a scanArea in the center of the screen
        overlay: QrScannerOverlayShape(
          borderColor: Colors.brown,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
        onQRViewCreated: _onQRViewCreated,
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No camera permission!'),
        ),
      );
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });

    _controller.scannedDataStream.listen((scannedData) {
      if (scannedData.code != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  'model viewer',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontFamily: 'antique',
                    color: Colors.brown,
                    fontSize: 33,
                  ),
                ),
                backgroundColor: Colors.white,
              ),
              body: ModelViewer(
                backgroundColor: Colors.white,
                autoPlay: true,
                cameraControls: true,
                touchAction: TouchAction.panX,
                autoRotateDelay: 2,
                autoRotate: true,
                src: scannedData.code ?? '',
                // src:
                // 'assets/models/car.glb',
                // 'https://github.com/raoufslv/3D-models/raw/main/models/car.glb',
                // 'https://github.com/raoufslv/3D-models/blob/main/models/car.glb',
                // 'https://github.com/raoufslv/3D-models/tree/main/models/car.glb',
                // 'https://github.com/raoufslv/3D-models/blame/main/models/car.glb',
                // 'https://github.com/raoufslv/3D-models/models/car.glb',
                // 'https://github.com/raoufslv/3D-models/blob/1ceb8683804ea59d6d05ff22e4bfa7474ce12f6d/models/car.glb',
                // 'https://github.dev/raoufslv/3D-models/raw/main/models/car.glb',
                // 'https://github.dev/raoufslv/3D-models/blob/main/models/car.glb',
                // 'https://github.dev/raoufslv/3D-models/tree/main/models/car.glb',
                // 'https://github.dev/raoufslv/3D-models/blame/main/models/car.glb',
                // 'https://github.dev/raoufslv/3D-models/models/car.glb',
                // 'https://github.dev/raoufslv/3D-models/blob/1ceb8683804ea59d6d05ff22e4bfa7474ce12f6d/models/car.glb',
                alt: 'A 3D model of the QR code scanned',
                ar: true,
                disableZoom: true,
              ),
            ),
          ),
        );
      } else {
        // Handle the case when the QR code data is null
        print(
            "-----------------------------------******Invalid QR code data******----------------------------------");
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

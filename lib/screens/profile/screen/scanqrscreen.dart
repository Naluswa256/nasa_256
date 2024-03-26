import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tiktok/screens/profile/screen/qrscreen.dart';
import 'package:tiktok/utils/color.dart';

class ScanQrSCreen extends StatefulWidget {
  const ScanQrSCreen({super.key});

  @override
  State<ScanQrSCreen> createState() => _ScanQrSCreenState();
}

class _ScanQrSCreenState extends State<ScanQrSCreen> {
  QRViewController? controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  String data = "";

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackcolor,
      appBar: AppBar(
        backgroundColor: blackcolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whitecolor),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Scan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(alignment: Alignment.bottomCenter, children: [
              _buildQrView(context),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const QrScreen());
                    },
                    child: Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: greyColor),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code_scanner_outlined,
                              color: whitecolor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'My QR Code',
                              style: TextStyle(
                                color: whitecolor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Icons.flash_on,
                            color: whitecolor,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            Icons.image,
                            color: whitecolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    // var scanArea = (MediaQuery.of(context).size.width < 400 ||
    //         MediaQuery.of(context).size.height < 400)
    //     ? 150.0
    //     : 450.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
        key: _qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutHeight: 250,
          cutOutWidth: 250,
          cutOutBottomOffset: 150,
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
        )
        // cutOutSize: scanArea),
        // onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      controller = controller;
      controller.toString();
      controller.scannedDataStream.listen((scanData) {
        data = scanData.code.toString();

        log('Scanned data: ${data.toString()}');
        // Handle the scanned data as desired
      });
    });
  }
}

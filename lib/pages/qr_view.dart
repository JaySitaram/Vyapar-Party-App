import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:vyapar_party_app/utils/utils.dart';
import 'package:vyapar_party_app/widget/barcode_detector_painter.dart';
import 'package:vyapar_party_app/widget/camera_view.dart';

import '../viewmodel/view_model.dart';

class BarcodeScannerView extends StatefulWidget {
  final Function(dynamic)? function;

  BarcodeScannerView({this.function});
  @override
  _BarcodeScannerViewState createState() => _BarcodeScannerViewState();
}

class _BarcodeScannerViewState extends State<BarcodeScannerView> {
  BarcodeScanner barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  bool isBusy = false;
  CustomPaint? customPaint;
  AddProductViewModel productViewModel=Get.find<AddProductViewModel>();

  @override
  void dispose() {
    barcodeScanner.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Barcode Scanner',
      customPaint: customPaint,
      onImage: (inputImage) {
        processImage(inputImage);
      },
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (isBusy) return;
    isBusy = true;
    final barcodes = await barcodeScanner.processImage(inputImage);
   for (Barcode barcode in barcodes) {
  final BarcodeType type = barcode.type;
  final Rect boundingBox = barcode.value.boundingBox!;
  final String displayValue = barcode.value.displayValue!;
  final String rawValue = barcode.value.rawValue!;

  // See API reference for complete list of supported types
  if(type==BarcodeType.product){
    print('sss ${barcode.value.boundingBox}');
    productViewModel.addProductBarCode(barcode.value);
    Get.back();
  }
}
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = BarcodeDetectorPainter(
          barcodes,
          inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation);
      customPaint = CustomPaint(painter: painter);
    } else {
      customPaint = null;
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}

part of 'pages.dart';

class SalesPage extends GetWidget<AddProductViewModel> {
  String? qr;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductViewModel>(
      init: AddProductViewModel(),
      builder: (controller) => Scaffold(
        body: PurchaseVariant(
                title: AppLocalizations.of(context)!.sale,
                addController: controller,
                function:(){
                      Get.to(BarcodeScannerView());
                    },
                price: controller.totalSellPrice.toString(),
              ),
      ),
    );
  }
}

part of 'pages.dart';

class PurchaseBillPage extends GetWidget<AddProductViewModel> {
  String? qr;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductViewModel>(
        init: AddProductViewModel(),
        builder: (controller) => Scaffold(
            body: PurchaseVariant(
                    title: AppLocalizations.of(context)!.purchase,
                    function:(){
                      Get.to(BarcodeScannerView());
                    },
                    addController: controller,price: controller.totalPurchasePrice.toString(),
                  )
               ));
  }
}

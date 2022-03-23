part of 'pages.dart';

class PurchaseVariant extends GetWidget<AddProductViewModel> {
  String? qr;
  String? title;
  String? price;
  Function? function;

  AddProductViewModel? addController;

  PurchaseVariant({this.addController, this.title, this.price, this.function});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: EdgeInsets.only(left: 20, right:20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, children: [
            Text(
              title!,
              style: getStyles(22.0, FontWeight.bold, AppColors.black),
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      "${addController!.productList.length} Products",
                      style:
                          getStyles(20.0, FontWeight.normal, AppColors.black),
                    ),
                ),
                Expanded(
                    child: Text(
                  price!,
                  style: getStyles(20.0, FontWeight.normal, AppColors.black),
                ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: addController!.productList.length,
                itemBuilder: (context, index) {
                  return addController!.productList[index] != null
                      ? CardWidget(
                          color: controller.productList[index].variantList![0]
                                  .inventory ??
                              "",
                          image: controller.productList[index].image,
                          qty: controller
                                  .productList[index].variantList![0].name ??
                              controller.initialQty,
                          functionDec: () => controller.decrement(controller
                              .productList[index].variantList![0].name),
                          functionInc: () => controller.increment(controller
                              .productList[index].variantList![0].name),
                          productName: controller.productList[index].pro_name,
                          product_price: controller.productList[index]
                                  .variantList![0].purchasePrice ??
                              "",
                          salePrice: controller.productList[index]
                                  .variantList![0].sellingPrice ??
                              "",
                          title: "${title} Price",
                        )
                      : Container();
                },
              ),
            ),
            SizedBox(height: 1.h),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        height: 7.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Get.toNamed(ADD_PRODUCT_ROUTE, arguments: price!);
                        },
                        color: AppColors.darkColor,
                        child: Text(
                          AppLocalizations.of(context)!.addMan,
                          style: getStyles(
                              20.0, FontWeight.normal, AppColors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: MaterialButton(
                        height: 7.h,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: AppColors.darkColor),
                        ),
                        onPressed: () {
                          function!();
                        },
                        child: Text(
                          AppLocalizations.of(context)!.scanBarcode,
                          style: getStyles(
                              20.0, FontWeight.normal, AppColors.darkColor),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.w),
                Container(
                  width: 100.w,
                  child: SwipeWidget(
                    title: AppLocalizations.of(context)!.swipeToProceed,
                    icon: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.white,
                    ),
                    actionFunction: () {
                      Get.toNamed(ADD_MANUAL_ROUTE, arguments: price!);
                    },
                  ),
                ),
                
                SizedBox(height: 3.w),
              ],
            )
          ]),
        ),
    );
  }
}

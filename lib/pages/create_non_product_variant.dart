part of 'pages.dart';

class CreateNonProductVariant extends GetWidget<AddProductViewModel> {
  var formKey;

  CreateNonProductVariant(
      {this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.salePrice,
                        style:
                            getStyles(18.0, FontWeight.normal, AppColors.black),
                      ),
                      SizedBox(height: 1.h),
                      TextFormWidget(
                        controller: createProductController[2],
                        hintText: "Enter Sale Price",
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            Get.snackbar(
                              "Product Input Error",
                              "Sale Price is empty",
                              icon: Icon(Icons.person, color: Colors.white),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 1.h,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.inventory,
                        style:
                            getStyles(18.0, FontWeight.normal, AppColors.black),
                      ),
                      SizedBox(height: 1.h),
                      TextFormWidget(
                        controller: createProductController[3],
                        hintText: "Enter Inventory",
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            Get.snackbar(
                              "Product Input Error",
                              "Inventory is empty",
                              icon: Icon(Icons.person, color: Colors.white),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Text(
              "Purchase Price",
              style: getStyles(18.0, FontWeight.normal, AppColors.black),
            ),
            SizedBox(height: 1.h),
            TextFormWidget(
              controller: createProductController[5],
              hintText: "Enter Purchase Price",
              keyboardType: TextInputType.text,
              obscureText: false,
              onChanged: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  Get.snackbar(
                    "Product Input Error",
                    "Purchase Price is empty",
                    icon: Icon(Icons.person, color: Colors.white),
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
            ),
            SizedBox(height: 2.h),
            Text(
              AppLocalizations.of(context)!.barCode,
              style: getStyles(18.0, FontWeight.normal, AppColors.black),
            ),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: TextFormWidget(
                    controller: createProductController[4],
                    hintText: "Enter Barcode",
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        Get.snackbar(
                          "Product Input Error",
                          "Barcode is empty",
                          icon: Icon(Icons.person, color: Colors.white),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => BarcodeScannerView()));
                      },
                      child: Icon(FontAwesomeIcons.camera)),
                ),
              ],
            ),
          ],
        ));
  }
}

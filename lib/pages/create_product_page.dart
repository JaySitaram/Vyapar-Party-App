part of 'pages.dart';

class CreateProductPage extends GetWidget<AddProductViewModel> {
  VariantModel variantModel = VariantModel();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductViewModel>(
      init: AddProductViewModel(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.createProduct,
                      style: getStyles(22.0, FontWeight.bold, AppColors.black),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Text(
                      AppLocalizations.of(context)!.addImage,
                      style:
                          getStyles(18.0, FontWeight.normal, AppColors.black),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoActionSheet(
                                  title: Text("Choose Image Picker Options"),
                                  actions: [
                                    CupertinoActionSheetAction(
                                      onPressed: () {
                                        controller.getImageGallery();
                                      },
                                      child: Text("Get Image From Gallery"),
                                    ),
                                    CupertinoActionSheetAction(
                                      onPressed: () {
                                        controller.getImageCamera();
                                      },
                                      child: Text("Get Image From Camera"),
                                    ),
                                  ],
                                ));
                      },
                      child: controller.imagePath != null
                          ? Image.file(File(controller.imagePath!),
                              height: 10.h, width: 10.h)
                          : Image.asset(Assets.user_image,
                              height: 10.h, width: 10.h),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      AppLocalizations.of(context)!.name,
                      style:
                          getStyles(18.0, FontWeight.normal, AppColors.black),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    TextFormWidget(
                      controller: createProductController[0],
                      hintText: AppLocalizations.of(context)!.productNameHint,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      onChanged: (value) {},
                      validator: (value) {},
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            AppLocalizations.of(context)!.createVariant,
                            style: getStyles(
                                18.0, FontWeight.normal, AppColors.black),
                          ),
                        ),
                        Expanded(
                          child: CupertinoSwitch(
                            value: controller.selected,
                            onChanged: (value) {
                              controller.setSelected(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    controller.selected
                        ? CreateProductVariant(
                            onChanged: () {
                              controller.changeStatus();
                            },
                            value: controller.showVariant!.isTrue,
                            formKey: formKey,
                            navigate: () {
                             
                              Get.to(BarcodeScannerView(
                                
                              ));
                            },
                          )
                        : CreateNonProductVariant(
                            formKey: formKey,
                          ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 65.w),
                      child: ButtonWidget(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.myVariantList.add(VariantModel(
                              barcode: createProductController[4].text,
                              inventory: createProductController[3].text,
                              name: createProductController[1].text,
                              purchasePrice: createProductController[5].text,
                              sellingPrice: createProductController[2].text,
                            ));
                            controller.addProduct(
                                ProductModel(
                                  image: controller.imagePath,
                                  pro_name: createProductController[0].text,
                                ), () {
                              Dialogs.materialDialog(
                                color: Colors.white,
                                msg: 'Product Created Successfully',
                                title: 'Congratulations',
                                lottieBuilder: Lottie.asset(
                                  'assets/assets.json',
                                  fit: BoxFit.contain,
                                ),
                                context: context,
                                actions: [
                                  IconsButton(
                                    onPressed: () {
                                      Get.toNamed(HOME_ROUTE);
                                    },
                                    text: 'Done',
                                    iconData: FontAwesomeIcons.check,
                                    color: Colors.blue,
                                    textStyle: TextStyle(color: Colors.white),
                                    iconColor: Colors.white,
                                  ),
                                ],
                              );
                            });
                          }
                        },
                        title: AppLocalizations.of(context)!.save,
                        fontSize: 24.0,
                        secondColor: AppColors.darkColor,
                        fontWeight: FontWeight.normal,
                        thirdColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

part of 'pages.dart';

class CreateProductVariant extends StatelessWidget {
  Function()? onChanged;
  Function()? navigate;
  var value;
  var formKey;
  CreateProductVariant({this.onChanged,this.value,this.formKey,this.navigate});
  @override
  Widget build(BuildContext context) {
    print('fff $value');
    return Form(
      key: formKey,
      child: Column(
        children: [
          ButtonWidget(
              onPressed: () {
                onChanged!();
              },
              title: AppLocalizations.of(context)!.createNew,
              fontSize: 18.0,
              secondColor: AppColors.darkColor,
              firstColor: AppColors.darkColor,
              fontWeight: FontWeight.normal,
              thirdColor: AppColors.white),
          SizedBox(
            height: 1.h,
          ),

         Visibility(
            visible:value,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 17),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.greyAccentColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.nameVariant,
                    style: getStyles(18.0, FontWeight.normal, AppColors.black),
                  ),
                  SizedBox(height: 1.h),
                  TextFormWidget(
                    controller: createProductController[1],
                    hintText: "Enter Name of variant",
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        Get.snackbar(
                          "Product Input Error",
                          "Variant Name is empty",
                          icon: Icon(Icons.person, color: Colors.white),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.salePrice,
                              style: getStyles(
                                  18.0, FontWeight.normal, AppColors.black),
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
                              style: getStyles(
                                  18.0, FontWeight.normal, AppColors.black),
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
                  SizedBox(height: 1.h),
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
                      Expanded(child: IconButton(
                        onPressed:(){
                          navigate!();
                        },
    icon:Icon(FontAwesomeIcons.camera))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

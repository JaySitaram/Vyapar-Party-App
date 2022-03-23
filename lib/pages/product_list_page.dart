part of 'pages.dart';

class ProductListPage extends GetWidget<AddProductViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductViewModel>(
        init: AddProductViewModel(),
        builder: (controller) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.toNamed(CREATE_PRODUCT_ROUTE);
              },
              child: CircleAvatar(
                radius: 40,
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: AppColors.white,
                ),
              ),
            ),
            body: SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        AppLocalizations.of(context)!.productList,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 22,
                            color: AppColors.black),
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Container(
                        height: 7.h,
                        child: TextFormWidget(
                          controller: addProductController,
                          hintText: AppLocalizations.of(context)!.search,
                          obscureText: false,
                          onChanged: (value){
                            controller.searchQuery(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.productList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return controller.productList[index] != null && controller.productList[index]
                                          .variantList![0]!=null
                              ? AddProductWidget(
                                  color: controller.productList[index]
                                          .variantList![0].inventory
                                      ?? "",
                                  image: controller.productList[index].image,
                                  qty: controller.productList[index]
                                          .variantList![0].name
                                      ??"",
                                  productName:
                                      controller.productList[index].pro_name,
                                  product_price:  controller.productList[index]
                                          .variantList![0].purchasePrice
                                      ??"",
                                  salePrice: controller.productList[index]
                                          .variantList![0].sellingPrice
                                      ??"",
                                )
                              : Container(

                              );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

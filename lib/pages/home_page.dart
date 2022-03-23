part of 'pages.dart';

class HomePage extends GetWidget<HomeViewModel>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.storeName,
                  style: getStyles(24.0, FontWeight.bold, AppColors.black),
                ),
                SizedBox(
                  height: 40,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: myCategory.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.black)),
                        child: GestureDetector(
                          onTap: () {
                            indexBasedNavigation(index);
                          },
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(myCategory[index].image!),
                                SizedBox(height: 20),
                                Text(
                                  myCategory[index].name!,
                                  textAlign: TextAlign.center,
                                  style: getStyles(
                                      18.0, FontWeight.normal, AppColors.black),
                                ),
                              ]),
                        ),
                      );
                    }),
                Spacer(),
                Text(
                  AppLocalizations.of(context)!.cr_invoice,
                  style: getStyles(22.0, FontWeight.bold, AppColors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(PURCHASE_ROUTE);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.grey)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(Assets.purchase),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                AppLocalizations.of(context)!.purchase,
                                style: getStyles(
                                    18.0, FontWeight.normal, AppColors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(SALES_ROUTE);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.grey)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(Assets.sales),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.sales,
                                  style: getStyles(
                                      18.0, FontWeight.normal, AppColors.black),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void indexBasedNavigation(int index) {
    if (index == 0) {
      Get.toNamed(ADD_PRODUCT_ROUTE);
    } else if (index == 1) {
      Get.toNamed(PARTY_DETAILS_ROUTE);
    } else if (index == 2) {
      Get.toNamed(INCOME_EXPENSE_ROUTE);
    } else {
      Get.toNamed(REPORT_ROUTE);
    }
  }
}
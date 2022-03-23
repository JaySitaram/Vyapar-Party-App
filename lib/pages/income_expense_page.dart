part of 'pages.dart';

class IncomeExpensePage extends GetWidget<IncomeExpenseViewModel> {
  @override
  Widget build(BuildContext context) {
   
    return GetBuilder<IncomeExpenseViewModel>(
        init: IncomeExpenseViewModel(),
        builder: (controller) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.toNamed(CREATE_INCOME_ROUTE);
              },
              // backgroundColor: AppColors.darkColor,
              child: Icon(FontAwesomeIcons.plus),
            ),
            body: SafeArea(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: TabBarWidget(
                tabTitle1: "Income",
                tabTitle2: "Expense",
                onTap: (value) {},
                controller: controller.tabController,
                widgetList: [
                  TransactionDetailWidget(
                    transactionMap: controller.getMaps
                        ,
                  ),
                  TransactionDetailWidget(
                    transactionMap: controller.getMaps
                      ,
                  ),
                ],
              ),
            )),
          );
        });
  }
}

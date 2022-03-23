part of 'pages.dart';

class ViewPartyScreen extends GetWidget<PartyDetailsViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PartyDetailsViewModel>(
      init: PartyDetailsViewModel(),
      builder: (controller) {
        return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(CREATE_PARTY_ROUTE);
          },
          child: Icon(
            FontAwesomeIcons.plus,
            color: AppColors.white,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.party,
                style: getStyles(24.0, FontWeight.normal, AppColors.white),
              ),
              TextFormWidget(
                controller: partySearchController,
                hintText: AppLocalizations.of(context)!.search,
                prefix: Icon(Icons.search),
                keyboardType: TextInputType.text,
                obscureText: false,
                onChanged: (value) {},
                validator: (value) {},
              ),
              Expanded(
                child: TabBarWidget(
                  tabTitle1: AppLocalizations.of(context)!.report,
                  tabTitle2: AppLocalizations.of(context)!.expense,
                  controller: controller.tabController,
                  onTap: (value) {},
                  widgetList: [
                    SaleTransactionPage(
                      transactionList: controller.partyList,
                      onTap: (index) {},
                    ),
                    SaleTransactionPage(
                      transactionList: controller.partyList,
                      onTap: (index) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}

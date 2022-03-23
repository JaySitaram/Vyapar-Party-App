part of 'pages.dart';

class PartyDetailsPage extends GetWidget<PartyDetailsViewModel> {
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
                  backgroundColor: AppColors.darkColor,
                  child: Icon(FontAwesomeIcons.plus, color: AppColors.white)),
              body: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.party,
                        style:
                            getStyles(20.0, FontWeight.bold, AppColors.black),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      TextFormWidget(
                        controller: partyDetailsController[0],
                        hintText: AppLocalizations.of(context)!.search,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        onChanged: (value) {
                          controller.searchQuery(value);
                        },
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Expanded(
                          child: TabBarWidget(
                        tabTitle1: AppLocalizations.of(context)!.sale,
                        tabTitle2: AppLocalizations.of(context)!.purchase,
                        controller: controller.tabController,
                        onTap: (value) {},
                        widgetList: [
                          PartyDetailsWidget(
                            controller:controller,
                            partyList: controller.partyList!=null?controller.partyList:
                               [],
                          ),
                          PartyDetailsWidget(
                            partyList: controller.partyList!=null?controller.partyList:
                                [],
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ));
        });
  }
}

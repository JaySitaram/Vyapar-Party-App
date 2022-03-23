part of 'pages.dart';

class AddManualProductPage extends GetWidget<AddProductViewModel> {
  String price = Get.arguments;

  FocusNode focusNode = FocusNode();
  FocusNode focusNode1=FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductViewModel>(
        init: AddProductViewModel(),
        builder: (controller) => Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10.w),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "${controller.productList.length} products",
                                    style: getStyles(20.0, FontWeight.normal,
                                        AppColors.black),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    price,
                                    style: getStyles(20.0, FontWeight.normal,
                                        AppColors.black),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              width: 100.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColors.black)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon: Icon(FontAwesomeIcons.caretDown),
                                  hint: Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                          AppLocalizations.of(context)!
                                              .paymentMode,
                                          style: getStyles(
                                              18.0,
                                              FontWeight.normal,
                                              AppColors.greyLight))),
                                  items: getPaymentList.map((e) {
                                    return DropdownMenuItem<String>(
                                      value:
                                          getPaymentList.indexOf(e).toString(),
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(e)),
                                    );
                                  }).toList(),
                                  value: controller.selectedDropValue != null
                                      ? controller.selectedDropValue!
                                      : null,
                                  onChanged: (value) {
                                    controller.setDropValue(value);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              AppLocalizations.of(context)!.amountReceived,
                              style: getStyles(
                                  20.0, FontWeight.normal, AppColors.black),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 30.w, bottom: 5.w),
                                child: TextFormField(
            
                                  autofocus: true,
                                  focusNode: focusNode1,
                                    decoration: InputDecoration(
                                      hintText: "0",
                                      hintStyle: getStyles(40.0,
                                          FontWeight.normal, AppColors.grey),
                                      border: InputBorder.none,
                                    ),
                                    controller:
                                        controller.amountReceiveController,
                                    onChanged: (value) {
                                      controller.checkStatus(price, value);
                                    },
                                    onTap: () {
                                      print("called");
                                      focusNode.unfocus();
                                    },
                                    cursorHeight: 40.0,
                                    style: getStyles(40.0, FontWeight.normal,
                                        AppColors.black),
                                  ),
                                ),
                            Text(
                              AppLocalizations.of(context)!.changeBalance,
                              style: getStyles(
                                  20.0, FontWeight.normal, AppColors.black),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.w),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "0",
                                  hintStyle: getStyles(
                                      40.0, FontWeight.normal, AppColors.grey),
                                  border: InputBorder.none,
                                ),
                                controller: controller.balanceController,
                                cursorHeight: 40.0,
                                style: getStyles(
                                    40.0,
                                    FontWeight.normal,
                                    controller.currentColor != null
                                        ? controller.currentColor
                                        : AppColors.black),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ButtonWidget(
                                    onPressed: () {
                                      Share.share(
                                          'check out my website https://example.com',
                                          subject: 'Look what I made!');
                                    },
                                    firstColor: AppColors.darkColor,
                                    title: AppLocalizations.of(context)!.share,
                                    fontSize: 20.0,
                                    secondColor: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    thirdColor: AppColors.darkColor,
                                  ),
                                ),
                                Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          // controller.changeValues();
                                        },
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 25.w),
                                            child: CircleAvatar(
                                                radius: 30,
                                                child: Icon(
                                                    FontAwesomeIcons.arrowRight,
                                                    color: AppColors.white))))),
                              ],
                            )
                          ],
                        ),
                        Positioned(
                          top: 5.h,
                          child: Container(
                            width: 100.w,
                            child: ChipsInput<PartyModel>(
                              function: (){
                   focusNode1.requestFocus();            
    focusNode.unfocus();
                              },
                              decoration: InputDecoration(
                                  suffixIcon: Icon(FontAwesomeIcons.plusCircle),
                                  prefixIcon: Icon(FontAwesomeIcons.search),
                                  hintText: 'Enter Party Details'),
                              findSuggestions: _findSuggestions,
                              onChanged: _onChanged,

                              focusNode: focusNode,
                              chipBuilder: (BuildContext context,
                                  ChipsInputState<PartyModel> state,
                                  PartyModel profile) {
                                return InputChip(
                                  key: ObjectKey(profile),
                                  label: Text(profile.name!),
                                  onDeleted: () => state.deleteChip(profile),
                                  onSelected: (_) => _onChipTapped(profile),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                );
                              },

                              suggestionBuilder: (BuildContext context,
                                  ChipsInputState<PartyModel> state,
                                  PartyModel profile) {
                                return Container(
                                  color: AppColors.white,
                                  child: ListTile(
                                    key: ObjectKey(profile),
                                    title: Text(profile.name!),
                                    subtitle: Text(profile.phno!),
                                    onTap: () =>
                                        state.selectSuggestion(profile),
                                  ),
                                );
                              },

                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  void _onChipTapped(PartyModel profile) {
    print('$profile');
  }

  void _onChanged(List<PartyModel> data) {
    print('onChanged $data');
  }

  Future<List> _findSuggestions(String query) async {
    if (query.length != 0) {
      return controller.partyList.where((profile) {
        return profile.name!.contains(query) || profile.phno!.contains(query);
      }).toList(growable: false);
    } else {
      return const <PartyModel>[];
    }
  }
}

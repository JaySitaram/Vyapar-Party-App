part of 'pages.dart';

class CreateIncomePage extends GetWidget<IncomeExpenseViewModel> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<IncomeExpenseViewModel>(
      init: IncomeExpenseViewModel(),
      initState: (_){
        IncomeExpenseViewModel().getIncome();
      },
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.createIncome,
                      style: getStyles(22.0, FontWeight.bold, AppColors.black),
                    ),
                    SizedBox(height: 4.h),
                    widgetMethod(AppLocalizations.of(context)!.header, 0,
                        AppLocalizations.of(context)!.headerError),
                    widgetMethod(AppLocalizations.of(context)!.amount, 1,
                        AppLocalizations.of(context)!.amountError),
                    widgetMethod(AppLocalizations.of(context)!.description, 2,
                        AppLocalizations.of(context)!.descriptionError),
                    Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.black)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: Icon(FontAwesomeIcons.caretDown),
                          items: getPaymentList.map((e) {
                            return DropdownMenuItem<String>(
                              value: getPaymentList.indexOf(e).toString(),
                              child: Text(e),
                            );
                          }).toList(),
                          value: controller.selectedDropValue,
                          onChanged: (value) {
                            controller.setDropValue(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ButtonWidget(
                    thirdColor: AppColors.white,
                    onPressed: () {
                      CreateIncomeModel model = CreateIncomeModel(
                        header: createIncomeList[0].text,
                        amount: createIncomeList[1].text,
                        description: createIncomeList[2].text,
                        paymentMode: controller.selectedDropValue,
                      );
                      controller.verifyIncome(context, model, () {
                        print("called");
                        Dialogs.materialDialog(
                          color: Colors.white,
                          msg: 'Income Created Successfully',
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
                    },
                    fontWeight: FontWeight.normal,
                    fontSize: 24.0,
                    firstColor: Colors.transparent,
                    secondColor: AppColors.darkColor,
                    title: AppLocalizations.of(context)!.save,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget widgetMethod(String s, int i, String t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(s,
            style: TextStyle(
                fontSize: 18, fontFamily: "Roboto", color: AppColors.black)),
        SizedBox(
          height: 2.w,
        ),
        TextFormWidget(
          hintText: i == 2 ? "Optional" : s,
          controller: createIncomeList[i],
          validator: (value) {
            return t;
          },
          obscureText: false,
          keyboardType: TextInputType.text,
        ),
        SizedBox(
          height: 5.w,
        ),
      ],
    );
  }
}

List<String> getPaymentList = ['Cash', 'Bank Transfer'];

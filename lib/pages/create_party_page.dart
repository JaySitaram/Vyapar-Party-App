part of 'pages.dart';

class CreatePartyPage extends GetWidget<PartyDetailsViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PartyDetailsViewModel>(
      init: PartyDetailsViewModel(),
      builder: (controller) => Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.createParty,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  widgetMethod(context, AppLocalizations.of(context)!.name, 0,
                      AppLocalizations.of(context)!.nameError),
                  widgetMethod(context, AppLocalizations.of(context)!.phTitle, 1,
                      AppLocalizations.of(context)!.phError),
                  widgetMethod(context, AppLocalizations.of(context)!.address, 2,
                      AppLocalizations.of(context)!.addError),
                  ButtonWidget(
                  onPressed: () {
                    PartyModel partyModel = PartyModel(
                      address: createPartyController[2].text,
                      name: createPartyController[0].text,
                      phno: createPartyController[1].text,
                    );
                    controller.verifyParty(context, partyModel, () {
                      Dialogs.materialDialog(
                        color: Colors.white,
                        msg: 'Party Created Successfully',
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
                  title: AppLocalizations.of(context)!.save,
                  fontSize: 24.0,
                  firstColor: AppColors.darkColor,
                  secondColor: AppColors.darkColor,
                  fontWeight: FontWeight.normal,
                  thirdColor: AppColors.white,
                ),
                ],
              ),
          ),
        ),
      ),
    );
  }

  Widget widgetMethod(BuildContext context, String s, int i, String t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          s,
          style: getStyles(18.0, FontWeight.normal, AppColors.black),
        ),
        SizedBox(
          height: 4.w,
        ),
        TextFormWidget(
          hintText: s == AppLocalizations.of(context)!.address ? "Optional" : s,
          controller: createPartyController[i],
          validator: (value) {
            return t;
          },
          obscureText: false,
          keyboardType: TextInputType.text,
        ),
        SizedBox(
          height: 8.w,
        ),
      ],
    );
  }
}

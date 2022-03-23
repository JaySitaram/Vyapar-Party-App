part of 'pages.dart';

class SignUpScreen extends GetWidget<SignUpViewModel> {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpViewModel>(
        init: SignUpViewModel(),
        builder: (controller) => Scaffold(
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        AppLocalizations.of(context)!.signUpTitle,
                        style:
                            getStyles(36.0, FontWeight.normal, AppColors.black),
                      ),
                      SizedBox(height: 1.w),
                      Text(
                        AppLocalizations.of(context)!.signUpDes,
                        style:
                            getStyles(15.0, FontWeight.normal, AppColors.black),
                      ),
                      SizedBox(
                        height: 6.w,
                      ),
                      widgetMethod(AppLocalizations.of(context)!.businessName,
                          0, AppLocalizations.of(context)!.businessNameErorr),
                      Text(
                        "Type of Business",
                        style:
                            getStyles(18.0, FontWeight.normal, AppColors.black),
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      Container(
                        // decoration: const InputDecoration(border: OutlineInputBorder()),
                        height: 15.w,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.black),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: Icon(FontAwesomeIcons.caretDown),
                            hint: Text(
                              AppLocalizations.of(context)!.businessType,
                              style: getStyles(
                                  14.0, FontWeight.normal, AppColors.greyLight),
                            ),
                            items: controller.bTList.map((e) {
                              return DropdownMenuItem<String>(
                                value: controller.bTList.indexOf(e).toString(),
                                child: Text(e),
                              );
                            }).toList(),
                            value: controller.currentDropValue,
                            onChanged: (value) {
                              controller.setSelectedValue(value!);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      widgetMethod(AppLocalizations.of(context)!.address, 2,
                          AppLocalizations.of(context)!.addError),
                      widgetMethod(AppLocalizations.of(context)!.phTitle, 3,
                          AppLocalizations.of(context)!.phError),
                      MaterialButton(
                        height: 5.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          controller.getOtpContent(signupController[3].text);
                        },
                        color: AppColors.darkColor,
                        child: Text(
                          AppLocalizations.of(context)!.verifyTitle,
                          style: getStyles(
                              18.0, FontWeight.normal, AppColors.white),
                        ),
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      widgetMethod(AppLocalizations.of(context)!.vericationCode,
                          4, AppLocalizations.of(context)!.verCoError),
                      widgetMethod(AppLocalizations.of(context)!.email, 5,
                          AppLocalizations.of(context)!.emailError),
                      widgetMethod(AppLocalizations.of(context)!.pass, 6,
                          AppLocalizations.of(context)!.passError),
                      widgetMethod(AppLocalizations.of(context)!.confPass, 7,
                          AppLocalizations.of(context)!.confError),
                      CheckboxListTile(
                        value: controller.currentCheckValue,
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                        onChanged: (value) {
                          controller.setCheckValue(value!);
                        },
                        title: Text.rich(
                          TextSpan(
                              text: 'I agree to all',
                              children: <InlineSpan>[
                                TextSpan(
                                  text: ' Terms & Conditions',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.darkColor),
                                ),
                                TextSpan(
                                  text: ' and',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: ' Privacy Policy',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.darkColor),
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      MaterialButton(
                        minWidth: 100.w,
                        height: 7.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () async {
                          controller.checkSignUpStatus(
                              context,
                              signupController[5].text,
                              signupController[6].text,
                              signupController[2].text,
                              signupController[7].text,
                              signupController[0].text,
                              signupController[3].text,
                              controller.currentDropValue!, () {
                            Get.toNamed(HOME_ROUTE);
                          });
                        },
                        color: AppColors.darkColor,
                        child: Text(
                          AppLocalizations.of(context)!.account,
                          style: getStyles(
                              24.0, FontWeight.normal, AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget widgetMethod(String s, int i, String t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          s,
          style: getStyles(18.0, FontWeight.normal, AppColors.black),
        ),
        SizedBox(
          height: 2.w,
        ),
        TextFormWidget(
          hintText: s,
          controller: signupController[i],
          validator: (value) {
            return t;
          },
          suffixIcon: i == 6 || i == 7
              ? IconButton(
                onPressed: (){
                  controller.changeToggle();
                },
                icon:controller.toggle?Icon(FontAwesomeIcons.eyeSlash):Icon(FontAwesomeIcons.eye)):null,
          obscureText: i == 6 || i == 7 ? controller.toggle : false,
          keyboardType: TextInputType.text,
        ),
        SizedBox(
          height: 4.w,
        ),
      ],
    );
  }
}

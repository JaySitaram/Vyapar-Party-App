part of 'pages.dart';

class LoginScreen extends GetWidget<LoginViewModel> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginViewModel>(
      init: LoginViewModel(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin:
              EdgeInsets.only(left: 5.w, top: 12.h, right: 5.w, bottom: 6.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.loginTitle,
                style: getStyles(36.0, FontWeight.bold, AppColors.black),
              ),
              Text(
                AppLocalizations.of(context)!.loginDes,
                style: getStyles(15.0, FontWeight.bold, AppColors.black),
              ),
              widgetMethod(context, AppLocalizations.of(context)!.email, 0,
                  AppLocalizations.of(context)!.emailError),
              widgetMethod(context, AppLocalizations.of(context)!.pass, 1,
                  AppLocalizations.of(context)!.passError),
              MaterialButton(
                minWidth: 100.w,
                height: 12.w,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () async {
                  controller.checkLoginStatus(
                      context, loginController[0].text, loginController[1].text,
                      () {
                    Get.toNamed(HOME_ROUTE);
                  });
                },
                child: Text(
                  AppLocalizations.of(context)!.loginTitle,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.white,
                      fontSize: 24),
                ),
                color: AppColors.darkColor,
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      var googleSignIn =
                          FirebaseGetData().getGoogleSignIn(callFunction: () {
                        Get.toNamed(HOME_ROUTE);
                      });
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.white,
                      child: Image.asset(Assets.google_logo),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      var facebookAuth =
                          FirebaseGetData().getFacebookLogin(callFunction: () {
                        Get.toNamed(HOME_ROUTE);
                      });
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.redAccent,
                      child: Image.asset(Assets.fb_logo, fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.notAccount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
              ),
              MaterialButton(
                minWidth: 100.w,
                height: 12.w,
                color: AppColors.darkColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Get.toNamed(SIGNUP_ROUTE);
                },
                child: Text(
                  AppLocalizations.of(context)!.signUpTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: AppColors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetMethod(BuildContext context, String s, int i, String t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        s == AppLocalizations.of(context)!.pass
            ? Container(
                width: 100.w,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        s,
                        style:
                            getStyles(18.0, FontWeight.normal, AppColors.black),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        AppLocalizations.of(context)!.forgotPass,
                        textAlign: TextAlign.end,
                        style:
                            getStyles(18.0, FontWeight.bold, AppColors.black),
                      ),
                    ))
                  ],
                ),
              )
            : Text(
                s,
                style: getStyles(18.0, FontWeight.normal, AppColors.black),
              ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 100.w,
          child: TextFormWidget(
            hintText: s,
            controller: loginController[i],
            validator: (value) {
              return t;
            },
            suffixIcon: s == AppLocalizations.of(context)!.pass? IconButton(onPressed: (){
              controller.changeToggle();
            }, icon: controller.toggle?Icon(FontAwesomeIcons.eye):Icon(FontAwesomeIcons.eyeSlash)):null,
            obscureText:  s == AppLocalizations.of(context)!.pass?controller.toggle:false,
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }
}

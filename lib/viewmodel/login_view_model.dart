part of 'view_model.dart';

class LoginViewModel extends GetxController {
  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();
  bool? connected;
  bool toggle=false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    checkInternet();
  }

  checkInternet() {
    if (_networkManager.connectionType == 0) {
      connected = false;
    } else {
      connected = true;
    }
    update();
  }

  changeToggle(){
    toggle=!toggle;
    update();
  }

  void checkLoginStatus(BuildContext context, String email, String password,
      Function navigate) async {
    var getLogin = await FirebaseGetData().getLogin(email, password);
    if (getLogin is! String) {
      if (GetUtils.isEmail(email) &&
          GetUtils.isLengthGreaterThan(password, 6)) {
        PreferenceUtils.setBool(AppLocalizations.of(context)!.islogin, true);
        navigate();
      } else if (!(GetUtils.isEmail(email) || email.isNotEmpty)) {
          Get.snackbar(
              "Email Error",
               "Enter Valid Email",
               icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,

               );

      } else if (!((GetUtils.isLengthGreaterThan(password, 6)) ||
          password.isNotEmpty)) {
              Get.snackbar(
              "Password Error",
               "Enter Valid Password",
               icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,

               );

      }
    } else {
          Get.snackbar(
              "Success",
               getLogin,
               icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,

               );

    }
  }
}

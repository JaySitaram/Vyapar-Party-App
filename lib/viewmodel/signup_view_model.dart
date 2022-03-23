part of 'view_model.dart';

class SignUpViewModel extends GetxController {
  List<String> bTList = [
    'Sole Proprietorships',
    'Partnerships',
    'Limited Liability Companies',
    'Corporations'
  ];
  bool? otpVerified;
  String? currentDropValue;
  bool? currentCheckValue = false;
  bool toggle=false;

  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();
  bool? connected;

  @override
  void onInit() {
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

  String? setSelectedValue(String value) {
    currentDropValue = value;
    print(currentDropValue);
    update();
  }

  bool? setCheckValue(bool value) {
    currentCheckValue = value;
    update();
  }

  void getOtpContent(String phone) {
    var content = FirebaseGetData().getOtpContent(phone);
    if (content != null) {
      otpVerified = true;
      update();
    }
  }

  void checkSignUpStatus(
      BuildContext context,
      String email,
      String password,
      String address,
      String confirmPassword,
      String businessName,
      String phoneNumber,
      String businessType,
      Function navigate) async {
    var getLogin = await FirebaseGetData().getSignIn(email, password);
    if (getLogin is! String) {
      if (GetUtils.isEmail(email) &&
          GetUtils.isLengthGreaterThan(password, 6) &&
          businessName.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          address.isNotEmpty) {
        PreferenceUtils.setBool(AppLocalizations.of(context)!.islogin, true);
        if (connected != null && connected!) {
          FirestoreStore().addTodo("User", "Add_User", {
            "businessName": businessName,
            "phoneNumber": phoneNumber,
            "address": address,
            "email": email,
            "password": password
          });
        } else {
          HiveService().addData('User', {
            "businessName": businessName,
            "phoneNumber": phoneNumber,
            "address": address,
            "email": email,
            "password": password
          });
        }
        navigate();
      } else if (!(GetUtils.isEmail(email) || email.isNotEmpty)) {
        Get.snackbar(
          "Email Error",
          "Please enter valid email",
          icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (!(GetUtils.isLengthGreaterThan(password, 6) ||
          password.isNotEmpty)) {
        Get.snackbar(
          "Password Error",
          "Please enter valid password",
          icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (businessName.isEmpty) {
        Get.snackbar(
          "BusinessName Error",
          "Please enter businessName",
          icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (phoneNumber.isEmpty) {
        Get.snackbar(
          "Phone Number Error",
          "Please enter Phone Number",
          icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (businessType.isEmpty) {
        Get.snackbar(
          "Business Type Error",
          "Please select Business Type",
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

  void changeToggle() {
    toggle=!toggle;
    update();
  }
}

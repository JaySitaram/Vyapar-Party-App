import 'dart:io';

import 'package:get/get.dart';
import 'package:vyapar_party_app/services/get_network_manager.dart';
import '../viewmodel/view_model.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpViewModel>(() => SignUpViewModel());
  }
}

class AddProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductViewModel>(() => AddProductViewModel());
  }
}

class ReportBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportViewModel>(() => ReportViewModel());
  }
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
  }
}

class IncomeExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncomeExpenseViewModel>(() => IncomeExpenseViewModel());
  }
}

class PartyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartyDetailsViewModel>(() => PartyDetailsViewModel());
  }
}

class PurchaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseViewModel>(() => PurchaseViewModel());
  }
}

class ViewPartyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewPartyViewModel>(() => ViewPartyViewModel());
  }
}

class NetworkBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
  }
}

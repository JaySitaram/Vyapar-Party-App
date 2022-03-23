part of 'view_model.dart';

class ReportViewModel extends GetxController {
  List<String> reportList = [
    'Sales Report',
    'Purchase Report',
    'Income Report',
    'Expense Report'
  ];
   final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();

  bool checkValue = false;
  RxList myProduct=[].obs;
  List get productList => myProduct.value;
  int? currentIndex;

  bool? connected;

  checkInternet() {
    if (_networkManager.connectionType == 0) {
      connected = false;
    } else {
      connected = true;
    }
    update();
  }

  setCheckValue(bool changeValue, int index) {
    checkValue = changeValue;
    currentIndex = index;
    print(checkValue);
    update();
  }

  void datePick(
      String? dateValue, DateTime? myDate, BuildContext? currentContext) async {
    final DateTime? picked = await showDatePicker(
        context: currentContext!,
        initialDate: myDate!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != dateValue)
      dateValue = DateFormat('dd-MM-yyyy – kk:mm').format(picked);
    update();
  }

   getProduct() async {
    print("clled");
    if (connected != null && connected!) {
      // FirestoreStore().todoStream("Product","Add_Product").then((event) {
      //   if (event.isNotEmpty && event[0] != null) {
      //     // productList =
      //     //     event.map((c) => ProductModel.fromJson(c.data(),c)).toList();
      //   }


      //   update();
      // });
    } else {
      var data =
          (await HiveService().getData('Add_Product', "Product")).toList();


      update();
    }
  }

}

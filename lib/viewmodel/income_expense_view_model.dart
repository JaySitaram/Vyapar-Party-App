part of 'view_model.dart';

class IncomeExpenseViewModel extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? tabController;

  String? selectedDropValue;
  List transactionList = [];
  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();
  bool? connected;
  Map<String, dynamic> getMaps = {};

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    checkInternet();
    getIncome();
  }

  checkInternet() {
    if (_networkManager.connectionType == 0) {
      connected = false;
    } else {
      connected = true;
    }
    update();
  }

  void setDropValue(String? value) {
    selectedDropValue = value;
    update();
  }

  addIncome(CreateIncomeModel productModel) {
    if (connected != null && connected!) {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm:ss');
      final String formatted = formatter.format(now);
      FirestoreStore().addTodo("Income", "Add_Income", {
        "id": transactionList.length + 1,
        "header": productModel.header,
        "amount": productModel.amount,
        "description": productModel.description,
        "paymentMode": productModel.paymentMode,
        "date": formatted
      });

      getIncome();
      update();
    } else {
      HiveService().addData('Add_Income', productModel);

      transactionList.clear();
      getIncome();
      update();
    }
  }

  getIncome() async {
    if (connected != null && connected!) {
      print("firs");
      FirestoreStore().todoStream("Income", "Add_Income").then((event) {
        if (event.isNotEmpty && event[0] != null) {
          transactionList =
              event.map((c) => CreateIncomeModel.fromJson(c.data())).toList();
          getMaps = groupBy(
              transactionList, (obj) => (obj as CreateIncomeModel).date!);

        }
        update();
      });
    } else {
      print("sec");
      var data = (await HiveService().getData('Add_Income', "Income")).toList();
      for (var value in data) {
        transactionList.add(value);
      }
      update();
    }
  }

  deleteIncome(CreateIncomeModel productModel) {
    if (connected != null && connected!) {
      FirestoreStore().deleteTodo(productModel.header!, "Income", "Add_Income");

      getIncome();
      update();
    } else {
      HiveService().deleteData("Add_Income");
      getIncome();
      update();
    }
  }

  void verifyIncome(
      BuildContext context, CreateIncomeModel model, Function function) {
    if (model.amount != null &&
        model.description != null &&
        model.header != null) {
      function();
      addIncome(model);
    }
    verifyInput(context, model.amount, "amount");

    verifyInput(context, model.description, "Description");
    verifyInput(context, model.header, "Header");
  }

  verifyInput(BuildContext context, String? amount, String title) {
    if (amount == null) {
      Get.snackbar(
        "Income Expense Input Error",
        "$title is empty",
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

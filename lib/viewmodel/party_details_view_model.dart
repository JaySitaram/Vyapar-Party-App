part of 'view_model.dart';

class PartyDetailsViewModel extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? tabController;
  List partyList = [];
  Map? currentMap;

  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();
  bool? connected;

  checkInternet() {
    if (_networkManager.connectionType == 0) {
      connected = false;
    } else {
      connected = true;
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    checkInternet();
    getParty();
  }

  addParty(PartyModel partyModel) {
    if (connected != null && connected!) {
      FirestoreStore().addTodo("Party", "Add_Party", {
        "Address": partyModel.address,
        "name": partyModel.name,
        "phoneNo": partyModel.phno,
      });
      partyList.clear();
      getParty();
      update();
    } else {
      HiveService().addData('Add_Party', partyModel);
      getParty();
      update();
    }
  }

  getParty({PartyModel? partyModel}) async {     
    if (connected != null && connected!) {
      FirestoreStore().todoStream("Party", "Add_Party").then((event) {       
         partyList = event.map((c) => PartyModel.fromJson(c.data())).toList();
          for(var value in partyList){
            if(partyModel!=null && value==partyModel){
              print("called");
              groupMap(value);
            }
          }
        update();
      });
    } else {
      var data = (await HiveService().getData('Add_Party', "Party")).toList();
      for (var value in data) {
        partyList.add(value);
      }
      update();
    }
  }

  deleteParty(PartyModel partyModel) {
    if (connected != null && connected!) {
      FirestoreStore().deleteTodo(partyModel.id!, "Party", "Add_Party");

      partyList.clear();
      update();
    } else {
      HiveService().deleteData("Add_Party");
      update();
    }
  }

  void verifyParty(
      BuildContext context, PartyModel partyModel, Function function) {
    if (partyModel.phno != null &&
        partyModel.name != null &&
        partyModel.address != null) {
      addParty(partyModel);
      function();
    }
    verifyInput(context, partyModel.name, "Name is required");
    verifyInput(context, partyModel.address, "Address is required");
    verifyInput(context, partyModel.phno, "Phone Number is required");
  }

  verifyInput(BuildContext context, String? amount, String s) {
    if (amount == null) {
      Get.snackbar(
        "Party Input Error",
        s,
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  updateTransactionParty(PartyModel partyModel) {
    List yourItemList = [];
    FirestoreStore().todoStream("Party", "Add_Party").then((event) {
      for (int i = 0; i < partyModel.transactionList!.length; i++) {
        if(partyModel.chatAmount==null){
          partyModel.chatAmount=0;
        }
         if (partyModel.transactionList![i].myStatus == 'Given') {
        partyModel.chatAmount = partyModel.chatAmount!+-int.parse(partyModel.transactionList![i].amount);
      } else {
        partyModel.chatAmount = partyModel.chatAmount!+int.parse(partyModel.transactionList![i].amount);
      }
        yourItemList.add({
          "date": partyModel.transactionList![i].date,
          "amount": partyModel.transactionList![i].amount,
         
          "myStatus": partyModel.transactionList![i].myStatus,
        });
        FirestoreStore().updateStatus(
            "Party",
            {
              "chatAmount":partyModel.chatAmount,
              "transactionList": FieldValue.arrayUnion(yourItemList),
            },
            event[0].id,
            "Add_Party");
      }

      getParty(partyModel:partyModel);
      update();
    });
  }

  void searchQuery(String value) async {
    partyList.clear();
    if (value.isEmpty) {
      getParty();
    }
    List<QueryDocumentSnapshot> queryRes = await FirestoreStore()
        .searchStream("Party", value, "Add_Party", "name");
    partyList = queryRes
        .map((c) => PartyModel.fromJson(c.data() as Map<String, dynamic>))
        .toList();
    update();
  }

  void groupMap(PartyModel model) {
          currentMap=groupBy(model.transactionList!.toList(),
                (obj) => (obj as TransactionDetailModel).date!);
    update();
  }
}

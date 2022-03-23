part of 'view_model.dart';

class AddProductViewModel extends GetxController {
  bool selected = false;
  String? selectedDropValue;
  PartyModel? selectedDropValue1;
  List productList = [];
  List partyList = [];
  List<VariantModel> myVariantList = [];
  String? imagePath;
  TextEditingController amountReceiveController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();
  bool? connected;
  RxBool? showVariant=false.obs;
  int totalSellPrice = 0;
  int totalPurchasePrice = 0;

  Color? currentColor;

  var initialQty = "1";

  AddProductViewModel(){
    checkInternet();
    getParty();
    getProduct();
  }

  checkInternet() {
    if (_networkManager.connectionType == 0) {
      connected = false;
    } else {
      connected = true;
    }
    update();
  }

  countIncome() {
    for (var value in productList) {
      for (var value1 in value.variantList) {
        totalSellPrice = totalSellPrice + int.parse(value1.sellingPrice);
        totalPurchasePrice =
            totalPurchasePrice + int.parse(value1.purchasePrice);
        print('$totalSellPrice : $totalPurchasePrice');
        update();
      }
    }
  }

  void setSelected(bool value) {
    selected = value;
    update();
  }

  void setDropValue(String? value) {
    selectedDropValue = value;
    update();
  }

  void setDropValue1(PartyModel? value) {
    selectedDropValue1 = value;
    update();
  }

  addProduct(ProductModel productModel,Function function) {
    if (connected != null && connected!) {
      for (int i = 0; i < myVariantList.length; i++) {
        FirestoreStore().addTodo("Product", "Add_Product",{
          "productName": productModel.pro_name,
          "variantList": [
            {
              "name": myVariantList[i].name,
              "inventory": myVariantList[i].inventory,
              "barcode": myVariantList[i].barcode,
              "purchasePrice": myVariantList[i].purchasePrice,
              "sellingPrice": myVariantList[i].sellingPrice
            },
          ]
        });
      }
      function();
      getProduct(image:productModel.image,productName:productModel.pro_name);
      update();
    } else {
      HiveService().addData('Add_Product', productModel);
      getProduct();
      update();
    }
  }

  getProduct({String? image,var productName}) async {
    if (connected != null && connected!) {
      FirestoreStore().todoStream("Product","Add_Product").then((event) {
          if(image!=null){
            for(int i=0;i<event.length;i++){
              print(productName);
              print('mmm ${event[i].data()}');
              if(productName==event[i].data()['productName'])
                FirestoreStore().uploadImage(image,event[i].id);
            }
            
          }
          productList =
              event.map((c) => ProductModel.fromJson(c.data(),c)).toList();
        countIncome();
        update();
      });
    } else {
      productList =
          (await HiveService().getData('Add_Product', "Product")).toList();

      countIncome();
      update();
    }
  }

  getParty() async {
    if (connected != null && connected!) {
      FirestoreStore().todoStream("Party","Add_Party").then((event) {
        partyList=event.map((c)=>PartyModel.fromJson(c.data())).toList();
        update();
      });
    } else {
      var data = (await HiveService().getData('Add_Party', "Party")).toList();
      partyList=data.map((c)=>PartyModel.fromJson(c)).toList();
      // for (var value in data) {
      //   partyList.add(value);
      // }
      update();
    }
  }

  deleteProduct(ProductModel productModel) {
    if (connected != null && connected!) {
      FirestoreStore().deleteTodo(productModel.id!, "Product","Add_Product");
      getProduct();
      update();
    } else {
      HiveService().deleteData("Add_Product");
      getProduct();
      update();
    }
  }

  getImageCamera() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.camera);
    if (image!.path != null) {
      imagePath = image.path;
      print(imagePath);
      update();
    }
  }

  getImageGallery() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image!.path != null) {
      imagePath = image.path;
      print(imagePath);
      update();
    }
  }

  void searchQuery(String value) async {
    productList.clear();
    if (value.isEmpty) {
      getProduct();
    }
    List<QueryDocumentSnapshot> queryRes =
        await FirestoreStore().searchStream("Product", value,"Add_Product","productName");
    productList =
        queryRes.map((c) => ProductModel.fromJson((c.data() as Map),c)).toList();
    update();
  }

  void checkStatus(String price, String value) {
    if (int.parse(value) < int.parse(price)) {
      balanceController.text = "- ${(int.parse(price) - int.parse(value))}";
      currentColor = AppColors.redAccent;
      update();
    } else {
      balanceController.text = "+ ${(int.parse(value) - int.parse(price))}";
      currentColor = AppColors.greenAccent;

      update();
    }
  }

  decrement(var qty) {
    if (qty != null && qty!.isNotEmpty && int.parse(qty!) >= 1) {
      qty = (int.parse(qty!) - 1).toString();
      update();
    } else if (int.parse(initialQty) >= 1) {
      initialQty = (int.parse(initialQty) - 1).toString();
      update();
    }
  }

  increment(var qty) {
    if (qty != null && qty!.isNotEmpty) {
      qty = (int.parse(qty!) + 1).toString();
      update();
    } else {
      initialQty = (int.parse(initialQty) + 1).toString();
      update();
    }
  }

  void changeStatus() {
    showVariant=true.obs;
    update();
  }

  void addProductBarCode(BarcodeValue value) {
    print(value.rawValue);
  
    createProductController[4].text=value.rawValue.toString();
    update();
  }
}

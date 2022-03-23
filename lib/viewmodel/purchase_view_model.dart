part of 'view_model.dart';

class PurchaseViewModel extends GetxController{
  bool scanCode=false;

  void changeQrStatus() {
    scanCode=!scanCode;
    update();
  }

}
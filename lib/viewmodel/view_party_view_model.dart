part of 'view_model.dart';

class ViewPartyViewModel extends GetxController with SingleGetTickerProviderMixin{
  TabController? tabController;

  initController(){
    tabController = TabController(length: 2, vsync: this);
  }
}
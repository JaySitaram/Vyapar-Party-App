part of 'widgets.dart';

class PartyDetailsWidget extends StatelessWidget {
  List? partyList;
  var getMaps;
  PartyDetailsViewModel? controller;
  PartyDetailsWidget({Key? key, this.partyList,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
        itemCount: partyList!.length,
        itemBuilder: (context, index) {
          print(partyList![index]);
          if (partyList![index]!=null) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                       controller!.groupMap(partyList![index]);
                      Get.toNamed(TRANSACTION_ROUTE,arguments: [partyList![index],index]);
                    },
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                               partyList![index].name
                                    ?? "",
                                style: getStyles(
                                    20.0, FontWeight.normal, AppColors.black))),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                   partyList![index].transactionList.toString()
                                      ,
                                  style: getStyles(20.0, FontWeight.normal,
                                      AppColors.black)),
                              Text(
                                   partyList![index].transactionList.toString()
                                      ,
                                  style: getStyles(
                                      20.0, FontWeight.normal, AppColors.black))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.black.withOpacity(0.5),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

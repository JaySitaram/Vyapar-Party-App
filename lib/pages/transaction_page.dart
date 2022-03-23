part of 'pages.dart';

class TransactionPage extends GetWidget<PartyDetailsViewModel> {
  PartyModel model=Get.arguments[0];
  int currentIndex=Get.arguments[1];

  @override
  Widget build(BuildContext context) {
   
    return GetBuilder<PartyDetailsViewModel>(
        init: PartyDetailsViewModel(),
        builder: (controller) {
          print(model.chatAmount);
          return Scaffold(
              body: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.name!,
                              style: getStyles(
                                  18.0, FontWeight.normal, AppColors.black),
                            ),
                            Text(
                              model.phno!,
                              style: getStyles(
                                  18.0, FontWeight.normal, AppColors.black),
                            ),
                          ],
                        ),
                        trailing: Icon(FontAwesomeIcons.ellipsisV),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      
                     Expanded(child:TransactionHistoryCard(
                           map:controller.currentMap
                          )),
                      Row(
                        children: [
                           Expanded(
                            child: Text(
                              getAmont(model.chatAmount!=null?model.chatAmount!:0),
                              style: getStyles(
                                  20.0, FontWeight.bold, AppColors.black),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              model.chatAmount!=null?model.chatAmount!.abs().toString():"0",
                              textAlign: TextAlign.end,
                              style: getStyles(
                                  20.0, FontWeight.normal, AppColors.black),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                              secondColor: AppColors.greenAccent,
                              onPressed: () {
                                Get.to(SendMoneyPage(
                                  partyModel: model, 
                                  value:  AppLocalizations.of(context)!.received,           
                                ));
                              },
                              title: AppLocalizations.of(context)!.received,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              thirdColor: AppColors.white,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                              child: ButtonWidget(
                            secondColor: AppColors.lightPink,
                            onPressed: () {
                                Get.to(SendMoneyPage(
                                  partyModel: model,   
                                     value:  AppLocalizations.of(context)!.given,             
                                ));
                            },
                            title: AppLocalizations.of(context)!.given,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            thirdColor: AppColors.white,
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
        });
  }

  getAmont(int valueAmount){
    if(valueAmount.isNegative){
      return "Balance Due";
    }
    else{
      return "Balance Advanced";
    }
  }
}
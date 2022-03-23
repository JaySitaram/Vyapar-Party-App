import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vyapar_party_app/model/party_model.dart';
import 'package:vyapar_party_app/model/transaction_detail_model.dart';
import 'package:vyapar_party_app/utils/styles.dart';
import 'package:vyapar_party_app/utils/utils.dart';
import 'package:vyapar_party_app/viewmodel/view_model.dart';
import 'package:vyapar_party_app/widget/txt.dart';

class SendMoneyPage extends StatefulWidget {
  PartyModel? partyModel;
  var value;
  SendMoneyPage({Key? key,this.partyModel,this.value}) : super(key: key);

  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  List numberAsList = [];

  String money = '20';

  TextEditingController amountReceiveController=TextEditingController();
  PartyDetailsViewModel partyViewModel=Get.find<PartyDetailsViewModel>();

  var selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leadingWidth: 40,
        leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              color: AppColors.black,
            )),
        title: Row(children: [
          Expanded(
              flex: 1,
              child: CircleAvatar(
                child: Text("A"),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.partyModel!.name!,
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold)),
                  Text(widget.partyModel!.phno!,
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColors.black,
                          fontWeight: FontWeight.normal)),
                ],
              )),
        ]),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Stack(
      children: [
        Positioned(
            top: 15.h,
            child: Column(
              children: [
                moneyWidget(),
                MyHomePage(
                  title: "Hello",
                  functions: (value){
                     selectedDate=value;
                  },
                ),
              ],
            )),
        Align(alignment: Alignment.bottomCenter, child: button()),
      ],
    );
  }

  Widget moneyWidget() {
    return Container(
      width: 100.w,
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "\$0",
          hintStyle: getStyles(40.0, FontWeight.normal, AppColors.grey),
          border: InputBorder.none,
        ),
        controller: amountReceiveController,
        onChanged: (value) {
          // controller.checkStatus(price, value);
        },
        cursorHeight: 40.0,
        textAlign: TextAlign.center,
        style: getStyles(40.0, FontWeight.normal, AppColors.black),
      ),
    );
  }

  Widget button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Container(
        height: 55,
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
                child: TextField(
              decoration: InputDecoration(hintText: "Enter Message(Optional)"),
            )),
            GestureDetector(
              onTap: (){
                widget.partyModel!.transactionList!.add(
                  TransactionDetailModel(
                    amount: amountReceiveController.text,
                    date: selectedDate,
                    myStatus: widget.value
                  )
                );
                partyViewModel.updateTransactionParty(widget.partyModel!);
              },
              child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.greenAccent,
                  child: Icon(
                    FontAwesomeIcons.check,
                    color: AppColors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  static List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, -1, 0, -1];
}

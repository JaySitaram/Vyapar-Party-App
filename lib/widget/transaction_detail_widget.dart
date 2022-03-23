import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vyapar_party_app/model/create_income_model.dart';

import '../model/transaction_detail_model.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';

class TransactionDetailWidget extends StatefulWidget {
  Map? transactionMap;
  TransactionDetailWidget({Key? key, this.transactionMap}) : super(key: key);

  @override
  _TransactionDetailWidgetState createState() =>
      _TransactionDetailWidgetState();
}

class _TransactionDetailWidgetState extends State<TransactionDetailWidget> {
  
  @override
  Widget build(BuildContext context) {
    print(widget.transactionMap!.length);
    return ListView.builder(
      itemBuilder: (context, index) {
        if (widget.transactionMap!= null) {
          var key=widget.transactionMap!.keys.elementAt(index);
          return Container(
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Text(
                  key
                      ?? "",
                  style:
                      getStyles(18.0, FontWeight.normal, AppColors.greyLight),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.w),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                    return Row(
                      children: [
                        Expanded(
                          child: Text((widget.transactionMap![key][index] as CreateIncomeModel).header!),
                        ),
                        Expanded(
                          child: Text((widget.transactionMap![key][index] as CreateIncomeModel).amount!),
                        ),
                      ],
                    );
                  },
                  itemCount: widget.transactionMap![key].length,
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
      },
      itemCount: widget.transactionMap!.length,
    );
  }
}

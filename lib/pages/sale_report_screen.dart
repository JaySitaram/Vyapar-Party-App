part of 'pages.dart';

class SaleTransactionPage extends GetWidget<ViewPartyViewModel> {
  List? transactionList;
  Function(dynamic)? onTap;
  SaleTransactionPage({Key? key, this.transactionList, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: transactionList!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onTap!(index);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        transactionList![index].name!,
                        style:
                            getStyles(20.0, FontWeight.normal, AppColors.black),
                      )),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            transactionList![index].amount!,
                            style: getStyles(
                                20.0, FontWeight.normal, AppColors.black),
                          ),
                          Text(
                            transactionList![index].status!,
                            style: getStyles(
                                20.0, FontWeight.normal, AppColors.black),
                          ),
                        ],
                      ))
                    ],
                  ),
                  Divider(
                    color: AppColors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

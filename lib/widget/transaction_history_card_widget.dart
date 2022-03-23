part of 'widgets.dart';

class TransactionHistoryCard extends StatelessWidget {
  // List? date;
  Map? map;
  // Color? color;
  TransactionHistoryCard({Key? key,this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index1) {
        var key=map!.keys.elementAt(index1);
        return Column(
          children: [
            Text(key,
                style: TextStyle(
                    color: AppColors.grey, fontFamily: 'Roboto', fontSize: 15)),
            ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var value=map![key][index] as TransactionDetailModel;
                      print(value);
                    
                      return Container(
                          height: 12.w,
                          width: 40.w,
                          margin: EdgeInsets.only(
                              left: value.myStatus ==
                                      'Given'
                                  ? 50.w
                                  : 0.w,
                              top: 13,
                              bottom: 13,
                              right: value.myStatus ==
                                      'Received'
                                  ? 50.w
                                  : 0.w),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.grey),
                          ),
                          child: Center(
                              child: Text(
                                   value.amount??
                                      "",
                                  style: TextStyle(
                                      color: getColor(index, index1,value),
                                      fontFamily: 'Roboto',
                                      fontSize: 15))));
                    },
                    itemCount: map![key].length,
                  ),
            SizedBox(
              height: 4.w,
            ),
          ],
        );
      },
      itemCount: map!.length,
    );
  }

  getColor(int index, int index1, TransactionDetailModel value) {
    return value.myStatus == 'Given'
        ? AppColors.redAccent
        : AppColors.greenAccent;
  }
}

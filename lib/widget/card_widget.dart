part of 'widgets.dart';

class CardWidget extends StatelessWidget {
  String? image;
  String? productName;
  String? qty;
  String? color;
  String? product_price;
  String? salePrice;
  String? title;
  Function? functionInc;
  Function? functionDec;
  CardWidget(
      {Key? key,
      this.image,
      this.productName,
      this.qty,
      this.title,
      this.color,
      this.functionDec,
      this.functionInc,
      this.product_price,
      this.salePrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 2),
      padding: EdgeInsets.only(left: 5,top:5,bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyLight,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: image!=null?Image.network(
               image!,
                 fit: BoxFit.cover,
                height: 17.h,
                width: 12.h,
              ):Container()),
          SizedBox(width: 30),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productName!,
                  style: getStyles(20.0, FontWeight.bold, AppColors.black),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        functionDec!();
                      
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 20,
                        child: Icon(
                          FontAwesomeIcons.minus,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Text(
                      qty!.isNotEmpty?qty!:"",
                      style: getStyles(18.0, FontWeight.bold, AppColors.black),
                    ),
                    GestureDetector(
                      onTap: (){
                        functionInc!();
                      
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 20,
                        child: Icon(
                          FontAwesomeIcons.plus,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  color!,
                  style: getStyles(18.0, FontWeight.normal, AppColors.black),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Text(
                      '${title} : ',
                      style: getStyles(
                          18.0, FontWeight.normal, AppColors.darkColor),
                    ),
                    Text(
                      product_price!,
                      style:
                          getStyles(18.0, FontWeight.normal, AppColors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

part of 'widgets.dart';

class AddProductWidget extends StatelessWidget {
  String? image;
  String? productName;
  String? qty;
  String? color;
  String? product_price;
  String? salePrice;
  String? title;
  AddProductWidget(
      {Key? key,
      this.image,
      this.productName,
      this.qty,
      this.title,
      this.color,
      this.product_price,
      this.salePrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 2),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: image!=null?Image.network(image!,width: 10.w,
                height: 17.h,):Container()),
          SizedBox(
            width: 10,
          ),
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
                Text(
                  qty!,
                  style: getStyles(18.0, FontWeight.normal, AppColors.black),
                ),
                Text(
                  color!,
                  style: getStyles(18.0, FontWeight.normal, AppColors.black),
                ),
                Row(
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.productPriceTitle} : ',
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
                Row(
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.salePrice} : ',
                      style: getStyles(
                          18.0, FontWeight.normal, AppColors.darkColor),
                    ),
                    Text(
                      salePrice!,
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

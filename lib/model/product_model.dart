import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  String? image;
  @HiveField(1)
  String? pro_name;
  @HiveField(2)
  String? id;
  @HiveField(3)
  String? quantity;
  @HiveField(4)
  List? variantList;

  ProductModel({this.image, this.pro_name, this.id, this.variantList});

  ProductModel.fromJson(Map map, var c) {
    this.image=map['image'];
    this.variantList=map['variantList'].map((c)=>VariantModel.fromJson(c)).toList();
    this.id=c.id;
    this.pro_name=map['productName'];
  }
}

@HiveType(typeId: 2)
class VariantModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? sellingPrice;
  @HiveField(2)
  String? purchasePrice;
  @HiveField(3)
  String? inventory;
  @HiveField(4)
  String? barcode;

  VariantModel({this.name, this.sellingPrice, this.inventory, this.barcode,this.purchasePrice});

  VariantModel.fromJson(Map<String,dynamic> map){
    this.name=map['name'];
    this.sellingPrice=map['sellingPrice'];
    this.purchasePrice=map['purchasePrice'];
    this.inventory=map['inventory'];
    this.barcode=map['barcode'];
  }
}

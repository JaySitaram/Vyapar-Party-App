import 'package:hive/hive.dart';

part 'transaction_detail_model.g.dart';

@HiveType(typeId: 5)
class TransactionDetailModel {
  @HiveField(0)
  String? date;
  @HiveField(1)
  String? category;
  @HiveField(2)
  String? amount;
  @HiveField(3)
  String? myStatus;
  TransactionDetailModel({this.date, this.category, this.amount,this.myStatus});

  TransactionDetailModel.fromJson(Map<String,dynamic> map){
    this.date=map['date'].toString();
    this.category=map['category'];
    this.amount=map['amount'];
    this.myStatus=map['myStatus'];
  }
}

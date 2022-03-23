import 'package:hive/hive.dart';

part 'create_income_model.g.dart';

@HiveType(typeId: 4)
class CreateIncomeModel {
  @HiveField(0)
  String? header;
  @HiveField(1)
  String? amount;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? paymentMode;
  @HiveField(4)
  String? date;

  CreateIncomeModel(
      {this.header,
      this.amount,
      this.description,
      this.paymentMode,
      this.date});

  CreateIncomeModel.fromJson(Map<String,dynamic> map){
    this.amount=map['amount'];
    this.paymentMode=map['paymentMode'];
    this.header=map['header'];
    this.description=map['description'];
    this.date=map['date'];
  }    
}

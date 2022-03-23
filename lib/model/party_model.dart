import 'package:hive/hive.dart';
import 'package:vyapar_party_app/model/transaction_detail_model.dart';

part 'party_model.g.dart';

@HiveType(typeId: 3)
class PartyModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? phno;
  @HiveField(3)
  String? address;
  @HiveField(4)
  List? transactionList;
  @HiveField(5)
  int? chatAmount;
  @HiveField(6)
  int? statusAmount;
  PartyModel(
      {this.id,
      this.name,
      this.phno,
      this.address,
      this.statusAmount,
      this.transactionList
     });

   PartyModel.fromJson(Map<String,dynamic> map){
    this.name=map['name'];
    this.phno=map['phoneNo'];
    this.address=map['Address'];
    this.statusAmount=map['statusAmount'];
    this.chatAmount=map['chatAmount'];
    this.transactionList=map.containsKey('transactionList')?map['transactionList'].map((c)=>TransactionDetailModel.fromJson(c)).toList():[];
  }        
}
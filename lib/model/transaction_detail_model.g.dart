// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionDetailModelAdapter
    extends TypeAdapter<TransactionDetailModel> {
  @override
  final int typeId = 5;

  @override
  TransactionDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionDetailModel(
      date: fields[0] as String?,
      category: fields[1] as String?,
      amount: fields[2] as String?,
      myStatus: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionDetailModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.myStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

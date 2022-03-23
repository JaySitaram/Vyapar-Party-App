// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_income_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreateIncomeModelAdapter extends TypeAdapter<CreateIncomeModel> {
  @override
  final int typeId = 4;

  @override
  CreateIncomeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreateIncomeModel(
      header: fields[0] as String?,
      amount: fields[1] as String?,
      description: fields[2] as String?,
      paymentMode: fields[3] as String?,
      date: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CreateIncomeModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.header)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.paymentMode)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateIncomeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

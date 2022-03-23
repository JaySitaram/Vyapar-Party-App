// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartyModelAdapter extends TypeAdapter<PartyModel> {
  @override
  final int typeId = 3;

  @override
  PartyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartyModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      phno: fields[2] as String?,
      address: fields[3] as String?,
      statusAmount: fields[6] as int?,
      transactionList: (fields[4] as List?)?.cast<dynamic>(),
    )..chatAmount = fields[5] as int?;
  }

  @override
  void write(BinaryWriter writer, PartyModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phno)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.transactionList)
      ..writeByte(5)
      ..write(obj.chatAmount)
      ..writeByte(6)
      ..write(obj.statusAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

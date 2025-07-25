// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiveSearch.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchModelAdapter extends TypeAdapter<SearchModel> {
  @override
  final int typeId = 0;

  @override
  SearchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchModel(
      imageUrl: fields[0] as String,
      name: fields[1] as String,
      rate: fields[2] as String,
      viewed: fields[3] as String,
      id: fields[4] as String,
      location: fields[5] as String,
      price: fields[6] as String,
      reciby: fields[7] as String,
      time: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SearchModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.imageUrl)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.rate)
      ..writeByte(3)
      ..write(obj.viewed)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.location)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.reciby)
      ..writeByte(8)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

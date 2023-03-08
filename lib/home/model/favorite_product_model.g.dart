// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteProductModelAdapter extends TypeAdapter<FavoriteProductModel> {
  @override
  final int typeId = 0;

  @override
  FavoriteProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteProductModel(
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteProductModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_document.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PdfDocumentAdapter extends TypeAdapter<PdfDocument> {
  @override
  final int typeId = 0;

  @override
  PdfDocument read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PdfDocument(
      id: fields[0] as String,
      title: fields[1] as String,
      filePath: fields[2] as String,
      fileSize: fields[3] as int,
      lastOpened: fields[4] as DateTime,
      totalPages: fields[5] as int,
      lastPageRead: fields[6] as int,
      isFavorite: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PdfDocument obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.filePath)
      ..writeByte(3)
      ..write(obj.fileSize)
      ..writeByte(4)
      ..write(obj.lastOpened)
      ..writeByte(5)
      ..write(obj.totalPages)
      ..writeByte(6)
      ..write(obj.lastPageRead)
      ..writeByte(7)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PdfDocumentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

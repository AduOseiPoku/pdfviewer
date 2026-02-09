import 'package:hive/hive.dart';

part 'pdf_document.g.dart';

@HiveType(typeId: 0)
class PdfDocument extends HiveObject {
  @HiveField(0)
  final String id;           // Unique ID
  
  @HiveField(1)
  final String title;        // File name to display
  
  @HiveField(2)
  final String filePath;     // Physical path on the device
  
  @HiveField(3)
  final int fileSize;        // Size in bytes
  
  @HiveField(4)
  final DateTime lastOpened; // For sorting "Recent Files"
  
  @HiveField(5)
  final int totalPages;      
  
  @HiveField(6)
  final int lastPageRead;    
  
  @HiveField(7)
  final bool isFavorite;     

  PdfDocument({
    required this.id,
    required this.title,
    required this.filePath,
    required this.fileSize,
    required this.lastOpened,
    this.totalPages = 0,
    this.lastPageRead = 0,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'filePath': filePath,
      'fileSize': fileSize,
      'lastOpened': lastOpened.toIso8601String(),
      'totalPages': totalPages,
      'lastPageRead': lastPageRead,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }
}

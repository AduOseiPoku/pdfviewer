import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileScannerService {
	Future<List<FileSystemEntity>> scanDocuments() async {
		var status = await Permission.storage.request();
		if (!status.isGranted) return [];

		Directory? documentsDir;
		try {
			documentsDir = await getApplicationDocumentsDirectory();
		} catch (_) {
			documentsDir = null;
		}
		if (documentsDir == null) return [];

		final allowedExtensions = ['pdf']; // Only PDF files
		final files = documentsDir
				.listSync()
				.where((f) =>
						f is File &&
						allowedExtensions.any((ext) =>
								f.path.toLowerCase().endsWith('.$ext')))
				.toList();
		return files;
	}
}

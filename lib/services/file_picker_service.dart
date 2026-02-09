import 'package:file_picker/file_picker.dart';

class FilePickerService {
  Future<PlatformFile?> pickPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      return result.files.single;
    }
    return null;
  }
}

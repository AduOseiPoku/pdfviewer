import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/pdf_document.dart';

class StorageService {
  static const String _historyBoxName = 'pdf_history';
  static const String _settingsPrefix = 'setting_';

  late SharedPreferences _prefs;
  late Box<PdfDocument> _historyBox;

  Future<void> init() async {
    // Initialize Hive
    await Hive.initFlutter();
    
    // Register Adapter
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(PdfDocumentAdapter());
    }
    
    // Open History Box
    _historyBox = await Hive.openBox<PdfDocument>(_historyBoxName);
    
    // Initialize SharedPreferences
    _prefs = await SharedPreferences.getInstance();
  }

  // --- History Methods (Hive) ---

  List<PdfDocument> getHistory() {
    return _historyBox.values.toList()
      ..sort((a, b) => b.lastOpened.compareTo(a.lastOpened));
  }

  Future<void> addToHistory(PdfDocument doc) async {
    await _historyBox.put(doc.id, doc);
  }

  Future<void> removeFromHistory(String id) async {
    await _historyBox.delete(id);
  }

  // --- Settings Methods (Shared Preferences) ---

  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool('$_settingsPrefix$key', value);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool('$_settingsPrefix$key') ?? defaultValue;
  }

  Future<void> setString(String key, String value) async {
    await _prefs.setString('$_settingsPrefix$key', value);
  }

  String? getString(String key) {
    return _prefs.getString('$_settingsPrefix$key');
  }
}

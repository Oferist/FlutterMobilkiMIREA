import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../database/antivirus_database.dart';
import '../../models/antivirus.dart';

@LazySingleton()
class AntivirusRepository {
  final AppDatabase _appDatabase;

  AntivirusRepository(this._appDatabase);

  Future<List<Antivirus>> getAntivirusList() async {
    try {
      print('🔄 Запрос данных из базы данных...');

      // Проверим доступность таблиц
      final tables = await _appDatabase.customSelect(
          "SELECT name FROM sqlite_master WHERE type='table'"
      ).get();

      print('📊 Таблицы в базе: ${tables.map((t) => t.read<String>('name')).toList()}');

      // Получаем данные
      final antivirusData = await _appDatabase.select(_appDatabase.antivirusItems).get();
      print('📥 Получено ${antivirusData.length} записей из БД');

      if (antivirusData.isEmpty) {
        throw Exception('База данных пуста');
      }

      // Преобразуем в модели
      final result = antivirusData.map((data) => Antivirus(
        name: data.name,
        description: data.description,
        shortDescription: data.shortDescription,
        iconUrl: data.iconUrl,
        color: Color(data.colorValue),
      )).toList();

      print('✅ Успешно загружено ${result.length} антивирусов');
      return result;

    } catch (e, stackTrace) {
      print('❌ Критическая ошибка при загрузке из БД: $e');
      print('🔍 Stack trace: $stackTrace');
      rethrow; // Пробрасываем ошибку дальше, без fallback
    }
  }

  Future<List<Antivirus>> searchAntivirus(String query) async {
    final allAntivirus = await getAntivirusList();
    return allAntivirus.where((antivirus) =>
        antivirus.name.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
}
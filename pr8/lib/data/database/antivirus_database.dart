import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:injectable/injectable.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'antivirus_database.g.dart';

class AntivirusItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get shortDescription => text()();
  TextColumn get iconUrl => text()();
  IntColumn get colorValue => integer()();
}

@LazySingleton()
@DriftDatabase(tables: [AntivirusItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      // Ждем создания таблиц перед заполнением
      await Future.delayed(Duration(milliseconds: 100));
      await _populateInitialData();
    },
  );

  Future<void> _populateInitialData() async {
    // Правильное использование batch
    await transaction(() async {
      await into(antivirusItems).insert(AntivirusItemsCompanion.insert(
        name: 'Kaspersky Internet Security',
        description: 'Комплексная защита от всех типов угроз для дома и бизнеса с продвинутыми функциями родительского контроля и безопасных платежей.',
        shortDescription: 'Комплексная защита от всех типов угроз',
        iconUrl: 'https://img.icons8.com/color/256/security-checked.png',
        colorValue: 0xFFFF5252,
      ));

      await into(antivirusItems).insert(AntivirusItemsCompanion.insert(
        name: 'Norton Antivirus',
        description: 'Надежная защита с минимальным воздействием на систему. Обладает smart firewall и защитой от кражи личных данных.',
        shortDescription: 'Надежная защита с минимальным воздействием на систему',
        iconUrl: 'https://img.icons8.com/color/256/shield.png',
        colorValue: 0xFF2196F3,
      ));

      await into(antivirusItems).insert(AntivirusItemsCompanion.insert(
        name: 'Avast Free Antivirus',
        description: 'Бесплатное решение с базовой защитой, включая антивирус, антишпион и веб-защиту. Идеально для начинающих пользователей.',
        shortDescription: 'Бесплатное решение с базовой защитой',
        iconUrl: 'https://img.icons8.com/color/256/antivirus-scanner.png',
        colorValue: 0xFF4CAF50,
      ));

      await into(antivirusItems).insert(AntivirusItemsCompanion.insert(
        name: 'Bitdefender Total Security',
        description: 'Полный набор функций для максимальной безопасности: VPN, менеджер паролей, защита веб-камеры и оптимизация системы.',
        shortDescription: 'Полный набор функций для максимальной безопасности',
        iconUrl: 'https://img.icons8.com/color/256/cyber-security.png',
        colorValue: 0xFFFF9800,
      ));

      await into(antivirusItems).insert(AntivirusItemsCompanion.insert(
        name: 'ESET NOD32 Antivirus',
        description: 'Быстрый и эффективный антивирусный движок с низким потреблением ресурсов. Отлично подходит для игровых ПК.',
        shortDescription: 'Быстрый и эффективный антивирусный движок',
        iconUrl: 'https://img.icons8.com/color/256/security-configuration.png',
        colorValue: 0xFF9C27B0,
      ));
    });

    print('✅ База данных успешно заполнена начальными данными');
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'antivirus.db'));

    print('📁 Путь к базе данных: ${file.path}');

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    return NativeDatabase(file);
  });
}
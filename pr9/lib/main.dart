import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di.dart';
import 'routes.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/profile_page.dart';
import 'pages/detail_page.dart';
import 'features/home/home_page.dart';
import 'data/database/antivirus_database.dart';
import 'theme/theme_cubit.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  print('🚀 Запуск инициализации приложения...');

  try {
    // Инициализируем DI
    configureDependencies();
    print('✅ DI контейнер инициализирован');

    // Принудительно получаем базу данных чтобы инициализировать её
    final database = getIt<AppDatabase>();
    print('✅ База данных получена из DI');

    // Проверяем что база работает - простой запрос
    final tables = await database.customSelect(
        "SELECT name FROM sqlite_master WHERE type='table'"
    ).get();

    print('📊 Таблицы в базе: ${tables.map((t) => t.read<String>('name')).toList()}');

    // Проверяем данные
    final testData = await database.select(database.antivirusItems).get();
    print('✅ Тестовый запрос выполнен, записей: ${testData.length}');

    for (var item in testData) {
      print('   - ${item.name}');
    }

    runApp(MyApp());

  } catch (e, stackTrace) {
    print('❌ Фатальная ошибка инициализации: $e');
    print('🔍 Stack trace: $stackTrace');

    runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.red[50],
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 64, color: Colors.red),
                  SizedBox(height: 20),
                  Text(
                    'Ошибка инициализации базы данных',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ошибка: $e',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Попробуем перезапустить
                      main();
                    },
                    child: Text('Перезапустить'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Оборачиваем MaterialApp в BlocProvider
    return BlocProvider(
      create: (_) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Антивирусы',

            // Подключаем наши кастомные темы
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode, // Состояние из Cubit

            debugShowCheckedModeBanner: false,
            initialRoute: Routes.loading,
            routes: {
              Routes.loading: (context) => const LoadingPage(),
              Routes.login: (context) => LoginPage(),
              Routes.register: (context) => RegisterPage(),
              Routes.home: (context) => const HomePage(),
              Routes.profile: (context) => ProfilePage(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == Routes.details) {
                final antivirus = settings.arguments as Map<String, dynamic>;
                return MaterialPageRoute(
                  builder: (context) => DetailPage(antivirus: antivirus),
                );
              }
              return null;
            },
          );
        },
      ),
    );
  }
}
// lib/main.dart

// Импорт основного пакета Flutter для работы с виджетами
import 'package:flutter/material.dart';

// Импорт пользовательского файла с объявлением путей (маршрутов) приложения
import 'routes.dart';

// Импорт всех страниц приложения
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/profile_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';

// Главная функция приложения - точка входа
void main() {
  // Запуск приложения с корневым виджетом MyApp
  runApp(MyApp());
}

// Основной класс приложения, наследуемый от StatelessWidget
class MyApp extends StatelessWidget {
  // Переопределение метода build, который описывает структуру виджета
  @override
  Widget build(BuildContext context) {
    // Возвращает MaterialApp - основной виджет Material Design
    return MaterialApp(
      // Заголовок приложения, отображается в диспетчере задач
      title: 'Антивирусы',

      // Настройка темы приложения
      theme: ThemeData(
        // Основной цвет приложения (создает палитру на основе синего)
        primarySwatch: Colors.blue,
        // Настройка текстовой темы
        textTheme: const TextTheme(
          // Стиль для крупных заголовков
          headlineLarge: TextStyle(
            fontFamily: 'serif',      // Шрифт с засечками
            fontSize: 26,            // Размер шрифта 26
            fontWeight: FontWeight.bold, // Жирное начертание
            fontStyle: FontStyle.italic, // Курсивное начертание
          ),
        ),
      ),

      // Установка начального маршрута при запуске приложения
      // Приложение начнет с экрана загрузки
      initialRoute: Routes.loading,

      // Определение статических маршрутов приложения
      // Карта, где ключ - название маршрута, значение - функция построения страницы
      routes: {
        Routes.loading: (context) => const LoadingPage(),  // Экран загрузки
        Routes.login: (context) => LoginPage(),           // Страница входа
        Routes.register: (context) => RegisterPage(),     // Страница регистрации
        Routes.home: (context) => HomePage(),             // Главная страница
        Routes.profile: (context) => ProfilePage(),       // Страница профиля
      },

      // Обработчик для генерации маршрутов с параметрами
      // Используется когда нужно передать данные между страницами
      onGenerateRoute: (settings) {
        // Проверяем, является ли запрашиваемый маршрут детальной страницей
        if (settings.name == Routes.details) {
          // Извлекаем переданные аргументы (данные об антивирусе)
          final antivirus = settings.arguments as Map<String, dynamic>;
          // Создаем страницу с передачей параметров
          return MaterialPageRoute(
            builder: (context) => DetailPage(antivirus: antivirus),
          );
        }
        // Если маршрут не распознан - возвращаем null
        return null;
      },

      // Отключение красной метки "DEBUG" в углу экрана
      debugShowCheckedModeBanner: false,
    );
  }
}
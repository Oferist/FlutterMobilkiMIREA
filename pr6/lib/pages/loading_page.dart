// lib/pages/loading_page.dart

// Импорт основного пакета Flutter для работы с виджетами
import 'package:flutter/material.dart';

// Импорт файла с маршрутами приложения
import '../routes.dart';

// Класс страницы загрузки как StatefulWidget
// StatefulWidget нужен для управления состоянием и выполнения асинхронных операций
class LoadingPage extends StatefulWidget {
  // Конструктор с ключом (key) для идентификации виджета
  const LoadingPage({super.key});

  // Создание состояния для страницы загрузки
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

// Класс состояния для страницы загрузки
class _LoadingPageState extends State<LoadingPage> {
  // Метод инициализации состояния, вызывается один раз при создании виджета
  @override
  void initState() {
    super.initState();  // Вызов метода initState родительского класса

    // Автоматический переход на страницу логина через 4 секунды
    Future.delayed(const Duration(seconds: 4), () {
      // Проверка, что виджет все еще mounted (не удален из дерева виджетов)
      // Это предотвращает ошибки при попытке обновить состояние несуществующего виджета
      if (!mounted) return;

      // Навигация на страницу логина с заменой текущей страницы
      // pushReplacementNamed заменяет текущий маршрут, чтобы нельзя было вернуться назад к экрану загрузки
      Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  // Построение интерфейса страницы загрузки
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Установка темно-синего фона для всей страницы
      backgroundColor: Colors.blue[800],

      // Основное содержимое страницы
      body: Center(
        // Центрирование всех дочерних элементов
        child: Column(
          // Вертикальное расположение элементов
          mainAxisAlignment: MainAxisAlignment.center,  // Центрирование по вертикали
          children: [
            // Загрузка иконки приложения из интернета
            Image.network(
              'https://img.icons8.com/color/256/antivirus-scanner.png',  // URL иконки антивируса
              width: 120,  // Ширина изображения
              height: 120,  // Высота изображения
              fit: BoxFit.contain,  // Сохранение пропорций изображения
            ),

            // Отступ между иконкой и текстом
            const SizedBox(height: 30),

            // Основное название приложения
            const Text(
              'АНТИВИРУСЫ',  // Текст названия приложения
              style: TextStyle(
                fontSize: 32,  // Крупный размер шрифта
                fontWeight: FontWeight.bold,  // Жирное начертание
                color: Colors.white,  // Белый цвет текста
                fontFamily: 'serif',  // Шрифт с засечками
                fontStyle: FontStyle.italic,  // Курсивное начертание
                letterSpacing: 2.0,  // Увеличенное расстояние между буквами
                shadows: [
                  // Добавление тени для лучшей читаемости
                  Shadow(
                    blurRadius: 4.0,  // Размер размытия тени
                    color: Colors.black,  // Черный цвет тени
                    offset: Offset(2.0, 2.0),  // Смещение тени по X и Y
                  ),
                ],
              ),
            ),

            // Отступ между основным и дополнительным текстом
            const SizedBox(height: 10),

            // Подзаголовок приложения
            const Text(
              'Защита вашего устройства',  // Описательный текст
              style: TextStyle(
                fontSize: 16,  // Стандартный размер шрифта
                color: Colors.white70,  // Светло-белый цвет с прозрачностью
              ),
            ),

            // Отступ между текстом и индикатором загрузки
            const SizedBox(height: 50),

            // Круговой индикатор загрузки
            const CircularProgressIndicator(
              color: Colors.white,  // Белый цвет индикатора
            ),
          ],
        ),
      ),
    );
  }
}
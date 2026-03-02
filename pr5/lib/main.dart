// Импорт необходимых библиотек Flutter
import 'package:flutter/material.dart';
// Импорт страницы входа (логина)
import 'pages/login_page.dart';
// Импорт страницы регистрации
import 'pages/register_page.dart';
// Импорт страницы профиля пользователя
import 'pages/profile_page.dart';

// Главная функция, точка входа в приложение
void main() {
  // Запуск приложения Flutter, передаем виджет MyApp как корневой
  runApp(MyApp());
}

// Основной класс приложения, наследуется от StatelessWidget (без состояния)
class MyApp extends StatelessWidget {
  // Переопределение метода build, который описывает внешний вид виджета
  @override
  Widget build(BuildContext context) {
    // Возвращает MaterialApp - основной виджет Material Design
    return MaterialApp(
      // Название приложения (отображается в диспетчере задач)
      title: 'Антивирусы',
      // Тема приложения (цвета, шрифты и т.д.)
      theme: ThemeData(
        // Основной цвет приложения (создает палитру на основе синего)
        primarySwatch: Colors.blue,
        // Тема текста для всего приложения
        textTheme: TextTheme(
          // Стиль для крупных заголовков
          headlineLarge: TextStyle(
            // Шрифт с засечками
            fontFamily: 'serif',
            // Размер шрифта 26 пунктов
            fontSize: 26,
            // Жирное начертание
            fontWeight: FontWeight.bold,
            // Курсивное начертание
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      // Начальный экран приложения - страница входа
      home: LoginPage(), // Запуск с экрана авторизации
      // Убираем баннер "DEBUG" в углу экрана
      debugShowCheckedModeBanner: false,
    );
  }
}

// Основной экран с антивирусами из практической работы №4
// StatefulWidget - виджет с изменяемым состоянием
class AntivirusPage extends StatefulWidget {
  // Обязательный метод для StatefulWidget - создает состояние
  @override
  _AntivirusPageState createState() => _AntivirusPageState();
}

// Класс состояния для AntivirusPage
class _AntivirusPageState extends State<AntivirusPage> {
  // Данные для горизонтального ListView с изображениями
  // final - неизменяемый список после инициализации
  final List<Map<String, String>> antivirusImages = [
    {
      'url': 'https://img.icons8.com/color/256/antivirus-scanner.png',
      'name': 'Поиск вирусов'
    },
    {
      'url': 'https://img.icons8.com/color/256/security-checked.png',
      'name': 'Защита ПК'
    },
    {
      'url': 'https://img.icons8.com/color/256/shield.png',
      'name': 'Устранение угроз'
    },
    {
      'url': 'https://img.icons8.com/color/256/cyber-security.png',
      'name': 'Кибербезопасность'
    },
    {
      'url': 'https://img.icons8.com/color/256/security-configuration.png',
      'name': 'Настройки безопасности'
    },
  ];

  // Данные для вертикального ListView с карточками
  // dynamic позволяет использовать разные типы данных в значениях
  final List<Map<String, dynamic>> antivirusList = [
    {
      'name': 'Kaspersky Internet Security',
      'description': 'Комплексная защита от всех типов угроз',
      'icon': Icons.security, // Иконка из Material Icons
      'color': Colors.red, // Цвет для иконки
    },
    {
      'name': 'Norton Antivirus',
      'description': 'Надежная защита с минимальным воздействием на систему',
      'icon': Icons.shield,
      'color': Colors.blue,
    },
    {
      'name': 'Avast Free Antivirus',
      'description': 'Бесплатное решение с базовой защитой',
      'icon': Icons.free_breakfast,
      'color': Colors.green,
    },
    {
      'name': 'Bitdefender Total Security',
      'description': 'Полный набор функций для максимальной безопасности',
      'icon': Icons.workspace_premium,
      'color': Colors.orange,
    },
    {
      'name': 'ESET NOD32 Antivirus',
      'description': 'Быстрый и эффективный антивирусный движок',
      'icon': Icons.rocket_launch,
      'color': Colors.purple,
    },
  ];

  // Метод для показа всплывающего уведомления (SnackBar)
  void _showSnackBar(BuildContext context, String antivirusName) {
    // Используем ScaffoldMessenger для управления SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      // Создаем сам SnackBar
      SnackBar(
        // Текст уведомления
        content: Text('Выбран: $antivirusName'),
        // Длительность показа (2 секунды)
        duration: Duration(seconds: 2),
        // Цвет фона SnackBar
        backgroundColor: Colors.blue,
        // Поведение - "плавающий" над контентом
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Построение интерфейса экрана
  @override
  Widget build(BuildContext context) {
    // Scaffold - базовый макет Material Design
    return Scaffold(
      // Верхняя панель приложения
      appBar: AppBar(
        // Заголовок в AppBar
        title: Text(
          'АНТИВИРУСЫ',
          // Стилизация текста заголовка
          style: TextStyle(
            fontFamily: 'serif',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            letterSpacing: 2.0, // Расстояние между буквами
            color: Colors.white,
            // Тени для текста
            shadows: [
              Shadow(
                blurRadius: 4.0, // Размытие тени
                color: Colors.black.withOpacity(0.5), // Цвет с прозрачностью
                offset: Offset(2.0, 2.0), // Смещение тени
              ),
            ],
          ),
        ),
        // Выравнивание заголовка по центру
        centerTitle: true,
        // Цвет фона AppBar
        backgroundColor: Colors.blue[800],
        // Кнопки в правой части AppBar
        actions: [
          // Кнопка-иконка для перехода в профиль
          IconButton(
            icon: Icon(Icons.person, color: Colors.white), // Иконка человека
            onPressed: () {
              // Навигация на страницу профиля
              Navigator.push(
                context,
                // Создание маршрута к ProfilePage
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            tooltip: 'Профиль', // Подсказка при долгом нажатии
          ),
        ],
      ),
      // Тело Scaffold - основной контент
      body: SingleChildScrollView(
        // Отступы вокруг всего контента
        padding: const EdgeInsets.all(16.0),
        // Колонка для вертикального расположения виджетов
        child: Column(
          // Выравнивание по левому краю
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Название ПО
            Text(
              'Антивирусное программное обеспечение',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            // Пустое пространство высотой 10 пикселей
            SizedBox(height: 10),

            // Описание ПО
            Text(
              'Антивирусы - это программы для обнаружения, предотвращения и удаления '
                  'вредоносного программного обеспечения. Они защищают компьютеры и мобильные '
                  'устройства от вирусов, троянов, шпионского ПО, ransomware и других угроз.',
              style: TextStyle(
                fontSize: 16,
                height: 1.4, // Межстрочный интервал
              ),
            ),
            SizedBox(height: 20),

            // Заголовок для горизонтального списка
            Text(
              'Типы защиты:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            SizedBox(height: 10),
            // Ограничиваем высоту горизонтального ListView
            SizedBox(
              height: 140, // Увеличил высоту для рамок
              // Горизонтальный список
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Горизонтальная прокрутка
                itemCount: antivirusImages.length, // Количество элементов
                // Функция построения каждого элемента
                itemBuilder: (context, index) {
                  return Container(
                    // Отступ справа между элементами
                    margin: EdgeInsets.only(right: 16),
                    // Колонка для каждого элемента (изображение + текст)
                    child: Column(
                      children: [
                        // Контейнер с рамкой и скругленными углами
                        Container(
                          width: 100,
                          height: 100,
                          // Декорация контейнера
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20), // Скругленные углы рамки
                            // Граница контейнера
                            border: Border.all(
                              color: Colors.blue, // Цвет рамки
                              width: 3, // Толщина рамки
                            ),
                            // Тень контейнера
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 8,
                                offset: Offset(2, 4), // Смещение тени
                              ),
                            ],
                          ),
                          // Обрезает дочерний виджет по скругленным углам
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16), // Скругленные углы изображения
                            // Загрузка изображения из сети
                            child: Image.network(
                              antivirusImages[index]['url']!, // URL изображения
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover, // Как изображение заполняет контейнер
                              // Builder для отображения прогресса загрузки
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child; // Если загружено - показываем изображение
                                // Иначе показываем индикатор загрузки
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              // Builder для обработки ошибок загрузки
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        // Название под изображением
                        Text(
                          antivirusImages[index]['name']!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500, // Полужирный
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),

            // Заголовок для вертикального списка
            Text(
              'Популярные антивирусы:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            SizedBox(height: 10),
            // Вертикальный список карточек
            ListView.builder(
              shrinkWrap: true, // Занимает только необходимую высоту
              physics: NeverScrollableScrollPhysics(), // Отключает собственную прокрутку
              itemCount: antivirusList.length,
              itemBuilder: (context, index) {
                final antivirus = antivirusList[index]; // Текущий элемент
                return Card(
                  elevation: 4, // Высота тени
                  margin: EdgeInsets.symmetric(vertical: 6), // Вертикальные отступы
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Скругленные углы карточек
                  ),
                  // Элемент списка Material Design
                  child: ListTile(
                    // Левая часть ListTile (иконка)
                    leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: antivirus['color'].withOpacity(0.1), // Цвет с прозрачностью
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        antivirus['icon'],
                        color: antivirus['color'],
                        size: 28,
                      ),
                    ),
                    // Заголовок карточки
                    title: Text(
                      antivirus['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    // Подзаголовок карточки
                    subtitle: Text(antivirus['description']),
                    // Правая часть ListTile (стрелка)
                    trailing: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                    // Обработчик нажатия на карточку
                    onTap: () {
                      _showSnackBar(context, antivirus['name']); // Показываем SnackBar
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            // ФИО и группа в центре экрана
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Выравнивание по центру
                children: [
                  // Иконка пользователя
                  Image.network(
                    'https://img.icons8.com/ios-filled/50/user-male-circle.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 8),
                  // Текст с информацией об авторе
                  Text(
                    'Некрасов Г.А., Группа ИКБО-28-22',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
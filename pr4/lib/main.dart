// Импорт библиотеки Flutter Material Design, которая содержит готовые визуальные компоненты
import 'package:flutter/material.dart';

// Главная функция, которая запускается при старте приложения
void main() {
  // Запуск приложения с виджетом MyApp в качестве корневого
  runApp(MyApp());
}

// Основной класс приложения, наследуется от StatelessWidget (виджет без состояния)
class MyApp extends StatelessWidget {
  // Переопределение метода build, который описывает как виджет должен отображаться
  @override
  Widget build(BuildContext context) {
    // Возвращает MaterialApp - основной виджет Material Design
    return MaterialApp(
      // Заголовок приложения
      title: 'Антивирусы',
      // Тема приложения
      theme: ThemeData(
        // Основной цвет темы
        primarySwatch: Colors.blue,
        // Тема текста
        textTheme: TextTheme(
          // Стиль для больших заголовков
          headlineLarge: TextStyle(
            // Шрифт с засечками
            fontFamily: 'serif',
            // Размер шрифта
            fontSize: 26,
            // Жирное начертание
            fontWeight: FontWeight.bold,
            // Курсивное начертание
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      // Стартовая страница приложения
      home: AntivirusPage(),
    );
  }
}

// Класс страницы с антивирусами, наследуется от StatefulWidget (виджет с состоянием)
class AntivirusPage extends StatefulWidget {
  // Переопределение метода создания состояния
  @override
  _AntivirusPageState createState() => _AntivirusPageState();
}

// Класс состояния для AntivirusPage
class _AntivirusPageState extends State<AntivirusPage> {
  // Данные для горизонтального ListView с изображениями
  // final - неизменяемый список
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
      'icon': Icons.security,
      'color': Colors.red,
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

  // Метод для показа всплывающего сообщения (SnackBar)
  void _showSnackBar(BuildContext context, String antivirusName) {
    // Получение ScaffoldMessenger для показа SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      // Создание SnackBar
      SnackBar(
        // Текст сообщения
        content: Text('Выбран: $antivirusName'),
        // Длительность показа (2 секунды)
        duration: Duration(seconds: 2),
        // Цвет фона
        backgroundColor: Colors.blue,
        // Стиль поведения (всплывающий)
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Переопределение метода build для отрисовки интерфейса
  @override
  Widget build(BuildContext context) {
    // Возвращает Scaffold - базовую структуру страницы Material Design
    return Scaffold(
      // Верхняя панель приложения
      appBar: AppBar(
        // Заголовок в AppBar
        title: Text(
          'АНТИВИРУСЫ',
          // Стиль текста заголовка
          style: TextStyle(
            fontFamily: 'serif',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            letterSpacing: 2.0, // Расстояние между буквами
            color: Colors.white,
            // Тени текста
            shadows: [
              Shadow(
                blurRadius: 4.0, // Размер размытия тени
                color: Colors.black.withOpacity(0.5), // Цвет тени с прозрачностью
                offset: Offset(2.0, 2.0), // Смещение тени
              ),
            ],
          ),
        ),
        // Выравнивание заголовка по центру
        centerTitle: true,
        // Цвет фона AppBar
        backgroundColor: Colors.blue[800],
      ),
      // Тело страницы
      body: SingleChildScrollView(
        // Внутренние отступы для всего содержимого
        padding: const EdgeInsets.all(16.0),
        // Колонка для вертикального расположения виджетов
        child: Column(
          // Выравнивание виджетов по началу горизонтальной оси
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
            // Ограничивающий виджет для фиксированной высоты
            SizedBox(
              height: 140, // Фиксированная высота контейнера
              // Горизонтальный список
              child: ListView.builder(
                // Горизонтальная прокрутка
                scrollDirection: Axis.horizontal,
                // Количество элементов в списке
                itemCount: antivirusImages.length,
                // Функция для построения каждого элемента
                itemBuilder: (context, index) {
                  // Контейнер для каждого элемента списка
                  return Container(
                    // Внешний отступ справа между элементами
                    margin: EdgeInsets.only(right: 16),
                    // Колонка для вертикального расположения изображения и текста
                    child: Column(
                      children: [
                        // Контейнер с рамкой для изображения
                        Container(
                          width: 100,
                          height: 100,
                          // Декорация контейнера
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // Скругленные углы рамки
                            borderRadius: BorderRadius.circular(20),
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
                                offset: Offset(2, 4),
                              ),
                            ],
                          ),
                          // Виджет для обрезки изображения со скругленными углами
                          child: ClipRRect(
                            // Скругленные углы изображения
                            borderRadius: BorderRadius.circular(16),
                            // Загрузка изображения из сети
                            child: Image.network(
                              // URL изображения
                              antivirusImages[index]['url']!,
                              width: 90,
                              height: 90,
                              // Способ масштабирования изображения
                              fit: BoxFit.cover,
                              // Builder для отображения прогресса загрузки
                              loadingBuilder: (context, child, loadingProgress) {
                                // Если загрузка завершена, возвращаем изображение
                                if (loadingProgress == null) return child;
                                // Иначе показываем индикатор загрузки
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              // Builder для обработки ошибок загрузки
                              errorBuilder: (context, error, stackTrace) {
                                // При ошибке показываем иконку ошибки
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
                            fontWeight: FontWeight.w500,
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
              // Автоматическое сжатие по содержимому
              shrinkWrap: true,
              // Отключение возможности прокрутки этого списка
              physics: NeverScrollableScrollPhysics(),
              itemCount: antivirusList.length,
              itemBuilder: (context, index) {
                // Получение данных текущего антивируса
                final antivirus = antivirusList[index];
                // Карточка для каждого антивируса
                return Card(
                  // Высота тени
                  elevation: 4,
                  // Внешние отступы карточки
                  margin: EdgeInsets.symmetric(vertical: 6),
                  // Форма карточки со скругленными углами
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Элемент списка
                  child: ListTile(
                    // Левая часть ListTile (иконка)
                    leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        // Цвет фона с прозрачностью
                        color: antivirus['color'].withOpacity(0.1),
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
                      // Вызов метода показа SnackBar
                      _showSnackBar(context, antivirus['name']);
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            // Блок с информацией о студенте
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Иконка пользователя
                  Image.network(
                    'https://img.icons8.com/ios-filled/50/user-male-circle.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 8),
                  // Текст с ФИО и группой
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
// lib/pages/home_page.dart

// Импорт основного пакета Flutter для работы с виджетами
import 'package:flutter/material.dart';

// Импорт для проверки платформы (Web/Desktop/Mobile)
import 'package:flutter/foundation.dart' show kIsWeb;

// Импорт для работы с платформенно-специфичными функциями
import 'dart:io' show Platform;

// Импорт файла с маршрутами приложения
import '../routes.dart';

// Импорт страницы деталей для навигации
import 'detail_page.dart';

// Импорт страницы профиля для навигации
import 'profile_page.dart';

// Класс главной страницы как StatefulWidget (нужен для управления состоянием навигации)
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // Создание состояния для главной страницы
  @override
  State<HomePage> createState() => _HomePageState();
}

// Класс состояния для главной страницы
class _HomePageState extends State<HomePage> {
  // Индекс выбранного элемента в нижней навигационной панели
  int _selectedIndex = 0;

  // Данные для горизонтального ListView с изображениями типов защиты
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

  // Данные для вертикального ListView с карточками антивирусов
  final List<Map<String, dynamic>> antivirusList = [
    {
      'name': 'Kaspersky Internet Security',
      'description': 'Комплексная защита от всех типов угроз для дома и бизнеса с продвинутыми функциями родительского контроля и безопасных платежей.',
      'icon': Icons.security,
      'color': Colors.red,
    },
    {
      'name': 'Norton Antivirus',
      'description': 'Надежная защита с минимальным воздействием на систему. Обладает smart firewall и защитой от кражи личных данных.',
      'icon': Icons.shield,
      'color': Colors.blue,
    },
    {
      'name': 'Avast Free Antivirus',
      'description': 'Бесплатное решение с базовой защитой, включая антивирус, антишпион и веб-защиту. Идеально для начинающих пользователей.',
      'icon': Icons.free_breakfast,
      'color': Colors.green,
    },
    {
      'name': 'Bitdefender Total Security',
      'description': 'Полный набор функций для максимальной безопасности: VPN, менеджер паролей, защита веб-камеры и оптимизация системы.',
      'icon': Icons.workspace_premium,
      'color': Colors.orange,
    },
    {
      'name': 'ESET NOD32 Antivirus',
      'description': 'Быстрый и эффективный антивирусный движок с низким потреблением ресурсов. Отлично подходит для игровых ПК.',
      'icon': Icons.rocket_launch,
      'color': Colors.purple,
    },
    {
      'name': 'McAfee Total Protection',
      'description': 'Многоуровневая защита для всех устройств с менеджером паролей и защитой от кражи личных данных.',
      'icon': Icons.verified_user,
      'color': Colors.cyan,
    },
  ];

  // Обработчик нажатия на элементы нижней навигационной панели
  void _onItemTapped(int index) {
    if (index == 2) {
      // Для профиля - навигация на отдельную страницу, но не меняем selectedIndex
      // Это позволяет вернуться на главную страницу с сохранением состояния
      Navigator.pushNamed(context, Routes.profile);
    } else {
      // Для главной и поиска - меняем экран внутри HomePage
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // Метод для получения текущего экрана в зависимости от выбранного индекса
  Widget _getCurrentScreen() {
    switch (_selectedIndex) {
      case 0:  // Главная страница
        return _AntivirusContent(
          antivirusImages: antivirusImages,
          antivirusList: antivirusList,
        );
      case 1:  // Страница поиска
        return const Center(child: Text('Поиск антивирусов...'));
      default:  // Запасной вариант - главная страница
        return _AntivirusContent(
          antivirusImages: antivirusImages,
          antivirusList: antivirusList,
        );
    }
  }

  // Построение интерфейса главной страницы
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Верхняя панель навигации
      appBar: AppBar(
        title: const Text(
          'АНТИВИРУСЫ',  // Заголовок приложения
          style: TextStyle(
            fontFamily: 'serif',  // Шрифт с засечками
            fontSize: 28,  // Крупный размер шрифта
            fontWeight: FontWeight.bold,  // Жирное начертание
            fontStyle: FontStyle.italic,  // Курсивное начертание
            letterSpacing: 2.0,  // Увеличенное расстояние между буквами
            color: Colors.white,  // Белый цвет текста
            shadows: [
              // Тень для лучшей читаемости
              Shadow(
                blurRadius: 4.0,  // Размер размытия тени
                color: Colors.black,  // Черный цвет тени
                offset: Offset(2.0, 2.0),  // Смещение тени
              ),
            ],
          ),
        ),
        centerTitle: true,  // Центрирование заголовка
        backgroundColor: Colors.blue[800],  // Темно-синий фон
        actions: [
          // Кнопка профиля в правой части аппбара
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Навигация на страницу профиля
              Navigator.pushNamed(context, Routes.profile);
            },
            tooltip: 'Профиль',  // Подсказка при наведении
          ),
        ],
      ),

      // Основное содержимое страницы (меняется в зависимости от выбранного индекса)
      body: _getCurrentScreen(),

      // Нижняя навигационная панель
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.deepPurple.shade50,  // Светло-фиолетовый фон
        indicatorColor: Colors.deepPurple.shade100,  // Цвет индикатора выбранного элемента
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,  // Всегда показывать подписи
        animationDuration: const Duration(milliseconds: 500),  // Длительность анимации перехода
        selectedIndex: _selectedIndex,  // Индекс выбранного элемента
        onDestinationSelected: _onItemTapped,  // Обработчик выбора элемента
        destinations: const [
          // Пункт "Главная"
          NavigationDestination(
            icon: Icon(Icons.home_outlined),  // Иконка невыбранного состояния
            selectedIcon: Icon(Icons.home),  // Иконка выбранного состояния
            label: 'Главная',  // Подпись
          ),
          // Пункт "Поиск"
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Поиск',
          ),
          // Пункт "Профиль"
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}

// Внутренний класс для содержимого антивирусов (отделен для лучшей организации кода)
class _AntivirusContent extends StatefulWidget {
  final List<Map<String, String>> antivirusImages;  // Данные для горизонтального списка
  final List<Map<String, dynamic>> antivirusList;  // Данные для вертикального списка

  const _AntivirusContent({
    required this.antivirusImages,
    required this.antivirusList,
  });

  @override
  State<_AntivirusContent> createState() => _AntivirusContentState();
}

// Класс состояния для содержимого антивирусов
class _AntivirusContentState extends State<_AntivirusContent> {
  // Метод для определения отступов в зависимости от платформы
  double get _platformPadding {
    // Для веб-версии и десктопных платформ - большие отступы
    if (kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      return 50;
    }
    // Для мобильных платформ - стандартные отступы
    return 20;
  }

  // Метод для навигации на страницу деталей антивируса
  void _navigateToDetail(Map<String, dynamic> antivirus) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(antivirus: antivirus),
      ),
    );
  }

  // Построение интерфейса содержимого антивирусов
  @override
  Widget build(BuildContext context) {
    // Получение информации о размерах экрана
    final mediaQuery = MediaQuery.of(context);
    // Проверка, является ли экран широким (больше 600 пикселей)
    final bool isWideScreen = mediaQuery.size.width > 600;

    return SingleChildScrollView(
      // Адаптивные отступы в зависимости от платформы
      padding: EdgeInsets.all(_platformPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,  // Выравнивание по левому краю
        children: [
          // Название раздела
          Text(
            'Антивирусное программное обеспечение',
            style: TextStyle(
              fontSize: isWideScreen ? 24 : 20,  // Адаптивный размер шрифта
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: _platformPadding),  // Адаптивный отступ

          // Описание раздела
          Text(
            'Антивирусы - это программы для обнаружения, предотвращения и удаления '
                'вредоносного программного обеспечения. Они защищают компьютеры и мобильные '
                'устройства от вирусов, троянов, шпионского ПО, ransomware и других угроз.',
            style: TextStyle(
              fontSize: isWideScreen ? 18 : 16,  // Адаптивный размер шрифта
              height: 1.4,  // Межстрочный интервал
            ),
          ),
          SizedBox(height: _platformPadding),

          // Заголовок для горизонтального списка
          Text(
            'Типы защиты:',
            style: TextStyle(
              fontSize: isWideScreen ? 20 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          SizedBox(height: 10),

          // Горизонтальный ListView с изображениями типов защиты
          SizedBox(
            height: 140,  // Фиксированная высота контейнера
            child: ListView.builder(
              scrollDirection: Axis.horizontal,  // Горизонтальная прокрутка
              itemCount: widget.antivirusImages.length,  // Количество элементов
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),  // Отступ между элементами
                  child: Column(
                    children: [
                      // Контейнер для изображения
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),  // Закругленные углы
                          border: Border.all(
                            color: Colors.blue,
                            width: 3,  // Толстая синяя рамка
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),  // Полупрозрачная тень
                              blurRadius: 8,  // Размытие тени
                              offset: const Offset(2, 4),  // Смещение тени
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),  // Закругление внутри рамки
                          child: Image.network(
                            widget.antivirusImages[index]['url']!,  // URL изображения
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,  // Обрезка изображения по контейнеру
                            loadingBuilder: (context, child, loadingProgress) {
                              // Показ индикатора загрузки пока изображение грузится
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              // Показ иконки ошибки если загрузка не удалась
                              return const Center(
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
                      const SizedBox(height: 8),
                      // Название типа защиты
                      Text(
                        widget.antivirusImages[index]['name']!,
                        style: TextStyle(
                          fontSize: isWideScreen ? 14 : 12,  // Адаптивный размер шрифта
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,  // Центрирование текста
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: _platformPadding),

          // Заголовок для списка антивирусов
          Text(
            'Популярные антивирусы:',
            style: TextStyle(
              fontSize: isWideScreen ? 20 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          SizedBox(height: 10),

          // Адаптивный выбор между GridView и ListView в зависимости от ширины экрана
          if (isWideScreen)
          // GridView для широких экранов (2 колонки)
            GridView.builder(
              shrinkWrap: true,  // Обертывание содержимого
              physics: const NeverScrollableScrollPhysics(),  // Отключение самостоятельной прокрутки
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,  // 2 колонки
                crossAxisSpacing: 16,  // Расстояние между колонками
                mainAxisSpacing: 16,  // Расстояние между строками
                childAspectRatio: 3,  // Соотношение сторон (ширина:высота = 3:1)
              ),
              itemCount: widget.antivirusList.length,
              itemBuilder: (context, index) {
                final antivirus = widget.antivirusList[index];
                return _buildAntivirusCard(antivirus, isWideScreen);
              },
            )
          else
          // ListView для узких экранов
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.antivirusList.length,
              itemBuilder: (context, index) {
                final antivirus = widget.antivirusList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _buildAntivirusCard(antivirus, isWideScreen),
                );
              },
            ),

          SizedBox(height: _platformPadding),

          // Информация о разработчике
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
                const SizedBox(width: 8),
                // ФИО и группа
                Text(
                  'Некрасов Г.А., Группа ИКБО-28-22',
                  style: TextStyle(
                    fontSize: isWideScreen ? 18 : 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: _platformPadding),
        ],
      ),
    );
  }

  // Метод для построения карточки антивируса
  Widget _buildAntivirusCard(Map<String, dynamic> antivirus, bool isWideScreen) {
    return Card(
      elevation: 4,  // Тень карточки
      margin: EdgeInsets.zero,  // Убираем внешние отступы
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),  // Закругленные углы
      ),
      child: ListTile(
        // Левая часть - иконка антивируса
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: antivirus['color'].withOpacity(0.1),  // Полупрозрачный фон цвета иконки
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            antivirus['icon'],  // Иконка из данных
            color: antivirus['color'],  // Цвет из данных
            size: isWideScreen ? 32 : 28,  // Адаптивный размер
          ),
        ),
        // Заголовок карточки
        title: Text(
          antivirus['name'],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isWideScreen ? 18 : 16,  // Адаптивный размер шрифта
          ),
        ),
        // Описание антивируса
        subtitle: Text(
          antivirus['description'],
          maxLines: isWideScreen ? 2 : 1,  // На широких экранах - 2 строки, на узких - 1
          overflow: TextOverflow.ellipsis,  // Многоточие если текст не помещается
        ),
        // Правая часть - стрелка для навигации
        trailing: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),  // Светло-серый фон
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: isWideScreen ? 20 : 18,  // Адаптивный размер
          ),
        ),
        // Обработчик нажатия на карточку
        onTap: () => _navigateToDetail(antivirus),
      ),
    );
  }
}
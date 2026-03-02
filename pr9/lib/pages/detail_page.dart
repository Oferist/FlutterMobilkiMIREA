// lib/pages/detail_page.dart

// Импорт основного пакета Flutter для работы с виджетами
import 'package:flutter/material.dart';

// Класс страницы деталей как StatelessWidget
// StatelessWidget подходит потому что страница только отображает переданные данные
class DetailPage extends StatelessWidget {
  // Параметр для получения данных об антивирусе с предыдущей страницы
  final Map<String, dynamic> antivirus;

  // Конструктор с обязательным параметром antivirus
  const DetailPage({super.key, required this.antivirus});

  // Построение интерфейса страницы деталей
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Верхняя панель навигации
      appBar: AppBar(
        // Динамический заголовок - название антивируса из переданных данных
        title: Text(
          antivirus['name'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,  // Жирное начертание
            color: Colors.white,  // Белый цвет текста
          ),
        ),
        // Темно-синий фон аппбара
        backgroundColor: Colors.blue[800],
        // Белый цвет иконок и элементов управления
        foregroundColor: Colors.white,
      ),

      // Основное содержимое страницы
      body: SingleChildScrollView(
        // Отступы со всех сторон для всего содержимого
        padding: const EdgeInsets.all(20),
        child: Column(
          // Выравнивание элементов по левому краю
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Центрированный блок с заголовком и иконкой
            Center(
              child: Column(
                children: [
                  // Контейнер для иконки антивируса
                  Container(
                    padding: const EdgeInsets.all(20),  // Внутренние отступы
                    decoration: BoxDecoration(
                      // Полупрозрачный фон цвета иконки (10% непрозрачности)
                      color: antivirus['color'].withOpacity(0.1),
                      // Закругленные углы контейнера
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      antivirus['icon'],  // Иконка из переданных данных
                      color: antivirus['color'],  // Цвет из переданных данных
                      size: 80,  // Крупный размер иконки
                    ),
                  ),
                  // Отступ между иконкой и названием
                  const SizedBox(height: 20),
                  // Название антивируса
                  Text(
                    antivirus['name'],
                    style: const TextStyle(
                      fontSize: 24,  // Крупный размер шрифта
                      fontWeight: FontWeight.bold,  // Жирное начертание
                    ),
                    textAlign: TextAlign.center,  // Центрирование текста
                  ),
                ],
              ),
            ),
            // Большой отступ после заголовочного блока
            const SizedBox(height: 30),

            // Заголовок раздела "Описание"
            const Text(
              'Описание:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,  // Фиолетовый цвет для заголовка
              ),
            ),
            // Небольшой отступ после заголовка
            const SizedBox(height: 10),
            // Основное описание антивируса
            Text(
              antivirus['description'],  // Текст описания из переданных данных
              style: const TextStyle(
                fontSize: 16,  // Стандартный размер шрифта
                height: 1.5,  // Увеличенный межстрочный интервал для лучшей читаемости
              ),
            ),
            // Отступ перед следующим разделом
            const SizedBox(height: 30),

            // Заголовок раздела "Характеристики"
            const Text(
              'Основные характеристики:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            // Небольшой отступ после заголовка
            const SizedBox(height: 10),
            // Список характеристик с использованием вспомогательного метода
            _buildFeatureItem('Защита в реальном времени', Icons.security),
            _buildFeatureItem('Антифишинг', Icons.phishing),
            _buildFeatureItem('Брандмауэр', Icons.fireplace),
            _buildFeatureItem('Защита от ransomware', Icons.lock),
            _buildFeatureItem('Родительский контроль', Icons.family_restroom),

            // Отступ перед кнопкой
            const SizedBox(height: 30),

            // Кнопка установки (занимает всю ширину)
            SizedBox(
              width: double.infinity,  // Ширина на весь экран
              height: 50,  // Фиксированная высота
              child: ElevatedButton(
                // Обработчик нажатия на кнопку
                onPressed: () {
                  // Показ всплывающего уведомления об установке
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      // Динамический текст с названием антивируса
                      content: Text('${antivirus['name']} устанавливается...'),
                      // Длительность показа уведомления (2 секунды)
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                // Стилизация кнопки
                style: ElevatedButton.styleFrom(
                  // Цвет кнопки соответствует цвету антивируса
                  backgroundColor: antivirus['color'],
                  // Закругленные углы кнопки
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Установить',  // Текст на кнопке
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,  // Белый цвет текста
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Вспомогательный метод для построения элемента характеристики
  Widget _buildFeatureItem(String text, IconData icon) {
    return Padding(
      // Вертикальные отступы между элементами
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Иконка характеристики
          Icon(
            icon,
            color: Colors.green,  // Зеленый цвет для всех иконок характеристик
            size: 20,  // Стандартный размер иконок
          ),
          // Отступ между иконкой и текстом
          const SizedBox(width: 10),
          // Текст характеристики, занимает все доступное пространство
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),  // Стандартный размер шрифта
            ),
          ),
        ],
      ),
    );
  }
}
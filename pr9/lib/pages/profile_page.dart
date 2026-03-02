// Импорт основного пакета Flutter для работы с виджетами
import 'package:flutter/material.dart';

// Импорт файла с маршрутами приложения
import '../routes.dart';

// Импорт кастомного виджета текстового поля
import '../widgets/text_field.dart';

// Импорт главного файла приложения (переименован для избежания конфликта)
import '../main.dart' as main_app;

import '../theme/theme_toggle_action.dart';

// Точка входа для тестирования этой страницы изолированно
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,  // Отключение дебаг баннера
    home: ProfilePage(),  // Установка ProfilePage как стартовой для тестирования
  ));
}

// Класс страницы профиля как StatefulWidget (нужен для управления состоянием формы)
class ProfilePage extends StatefulWidget {
  // Создание состояния для страницы профиля
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

// Класс состояния для страницы профиля
class _ProfilePageState extends State<ProfilePage> {
  // Ключ для управления состоянием формы (валидация, сброс и т.д.)
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для управления текстом в полях ввода с предзаполненными данными
  final _nameController = TextEditingController(text: 'Иванов Иван Иванович');  // Предзаполненное ФИО
  final _emailController = TextEditingController(text: 'test123@mail.ru');  // Предзаполненный email
  final _passwordController = TextEditingController();  // Пустой контроллер для нового пароля
  final _confirmPasswordController = TextEditingController();  // Пустой контроллер для подтверждения пароля

  // Узлы фокуса для управления переходом между полями ввода
  final _nameFocusNode = FocusNode();  // Фокус для поля ФИО
  final _emailFocusNode = FocusNode();  // Фокус для поля email
  final _passwordFocusNode = FocusNode();  // Фокус для поля пароля
  final _confirmPasswordFocusNode = FocusNode();  // Фокус для подтверждения пароля

  // Метод очистки ресурсов при уничтожении виджета
  @override
  void dispose() {
    // Освобождение контроллеров для предотвращения утечек памяти
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    // Освобождение узлов фокуса
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();

    // Вызов метода dispose родительского класса
    super.dispose();
  }

  // Метод сохранения профиля пользователя
  void _saveProfile() {
    // Проверка валидности всех полей формы
    if (_formKey.currentState!.validate()) {
      // Проверка совпадения паролей только если пользователь ввел новый пароль
      if (_passwordController.text.isNotEmpty &&
          _passwordController.text != _confirmPasswordController.text) {
        // Показ сообщения об ошибке если пароли не совпадают
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Пароли не совпадают')),
        );
        return;  // Прерывание выполнения если пароли не совпали
      }

      // Показ сообщения об успешном сохранении профиля
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Профиль сохранен')),
      );
    }
  }

  // Метод выхода из аккаунта
  void _logout() {
    // Навигация на страницу входа с заменой текущей (чтобы нельзя было вернуться назад)
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  // Построение интерфейса страницы профиля
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Верхняя панель навигации
      appBar: AppBar(
        title: Text('Профиль'),  // Заголовок страницы
        // backgroundColor: Colors.blue,  // Синий фон аппбара
        // foregroundColor: Colors.white,  // Белый цвет текста и иконок
        actions: [
          // --- ДОБАВЛЕНА КНОПКА СМЕНЫ ТЕМЫ ---
          const ThemeToggleAction(),

          // Кнопка выхода в правой части аппбара
          IconButton(
            icon: Icon(Icons.logout),  // Иконка выхода
            onPressed: _logout,  // Обработчик нажатия - метод _logout
            tooltip: 'Выйти',  // Подсказка при долгом нажатии
          ),
        ],
      ),

      // Белый фон всей страницы
      // backgroundColor: Colors.white,

      // Основное содержимое страницы
      body: SafeArea(
        // SafeArea обеспечивает отступы от выемок и элементов системы
        child: SingleChildScrollView(
          // Прокручиваемый контент для адаптации под разные экраны
          padding: EdgeInsets.all(24),  // Отступы со всех сторон
          child: Form(
            // Форма для группировки полей ввода и валидации
            key: _formKey,  // Привязка ключа формы
            child: Column(
              // Вертикальное расположение элементов
              crossAxisAlignment: CrossAxisAlignment.start,  // Выравнивание по левому краю
              children: [
                // Пустое пространство сверху
                SizedBox(height: 20),

                // Центрированный аватар пользователя
                Center(
                  child: CircleAvatar(
                    radius: 50,  // Радиус круга аватара
                    backgroundColor: Colors.blue[100],  // Светло-синий фон аватара
                    child: Icon(
                      Icons.person,  // Иконка человека
                      size: 50,  // Размер иконки
                      color: Colors.blue,  // Синий цвет иконки
                    ),
                  ),
                ),

                // Отступ между аватаром и заголовком
                SizedBox(height: 30),

                // Заголовок страницы профиля
                Text(
                  'Профиль',
                  style: TextStyle(
                    fontSize: 24,  // Размер шрифта
                    fontWeight: FontWeight.bold,  // Жирное начертание
                    color: Colors.blue[800],  // Темно-синий цвет
                  ),
                ),

                // Отступ между заголовком и полями ввода
                SizedBox(height: 20),

                // Кастомное поле ввода для ФИО с предзаполненными данными
                CustomTextField(
                  controller: _nameController,  // Контроллер для ФИО с предзаполненным значением
                  labelText: 'ФИО',  // Метка поля
                  keyboardType: TextInputType.name,  // Тип клавиатуры для имени
                  focusNode: _nameFocusNode,  // Узел фокуса для этого поля
                  nextFocusNode: _emailFocusNode,  // Следующее поле для фокуса
                  prefixIcon: Icons.person,  // Иконка человека
                ),

                // Отступ между полями
                SizedBox(height: 20),

                // Кастомное поле ввода для email с предзаполненными данными
                CustomTextField(
                  controller: _emailController,  // Контроллер для email с предзаполненным значением
                  labelText: 'Email',  // Метка поля
                  keyboardType: TextInputType.emailAddress,  // Тип клавиатуры для email
                  focusNode: _emailFocusNode,  // Узел фокуса для этого поля
                  nextFocusNode: _passwordFocusNode,  // Следующее поле для фокуса
                  prefixIcon: Icons.email,  // Иконка email
                ),

                // Отступ между полями
                SizedBox(height: 20),

                // Кастомное поле ввода для нового пароля (необязательное)
                CustomTextField(
                  controller: _passwordController,  // Контроллер для нового пароля
                  labelText: 'Пароль',  // Метка поля
                  keyboardType: TextInputType.visiblePassword,  // Тип клавиатуры для пароля
                  isPassword: true,  // Флаг что это поле пароля
                  focusNode: _passwordFocusNode,  // Узел фокуса для этого поля
                  nextFocusNode: _confirmPasswordFocusNode,  // Следующее поле для фокуса
                  prefixIcon: Icons.lock,  // Иконка замка
                ),

                // Отступ между полями
                SizedBox(height: 20),

                // Кастомное поле ввода для подтверждения нового пароля
                CustomTextField(
                  controller: _confirmPasswordController,  // Контроллер для подтверждения пароля
                  labelText: 'Повторите пароль',  // Метка поля
                  keyboardType: TextInputType.visiblePassword,  // Тип клавиатуры для пароля
                  isPassword: true,  // Флаг что это поле пароля
                  focusNode: _confirmPasswordFocusNode,  // Узел фокуса для этого поля
                  prefixIcon: Icons.lock_outline,  // Иконка замка (контурная)
                ),

                // Отступ перед кнопкой сохранения
                SizedBox(height: 30),

                // Кнопка сохранения профиля (занимает всю ширину)
                SizedBox(
                  width: double.infinity,  // Ширина на весь экран
                  height: 50,  // Фиксированная высота
                  child: ElevatedButton(
                    onPressed: _saveProfile,  // Обработчик нажатия - метод _saveProfile
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,  // Синий фон кнопки
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),  // Закругленные углы
                      ),
                    ),
                    child: Text(
                      'Сохранить',  // Текст на кнопке
                      style: TextStyle(
                        fontSize: 18,  // Размер шрифта
                        fontWeight: FontWeight.bold,  // Жирное начертание
                        color: Colors.white,  // Белый цвет текста
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
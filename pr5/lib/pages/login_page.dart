// Импорт основной библиотеки Flutter
import 'package:flutter/material.dart';
// Импорт кастомного виджета текстового поля
import '../widgets/text_field.dart';
// Импорт страницы регистрации для навигации
import 'register_page.dart';
// Импорт главного файла приложения (для доступа к AntivirusPage)
import '../main.dart';

// Точка входа для тестирования этой страницы отдельно
void main() {
  runApp(MaterialApp(
    // Убираем баннер "DEBUG" в углу экрана
    debugShowCheckedModeBanner: false,
    // Устанавливаем LoginPage как стартовый экран (для тестирования)
    home: LoginPage(),
  ));
}

// Страница входа в приложение - StatefulWidget так как содержит форму
class LoginPage extends StatefulWidget {
  // Создание состояния для страницы входа
  @override
  _LoginPageState createState() => _LoginPageState();
}

// Класс состояния для страницы входа
class _LoginPageState extends State<LoginPage> {
  // Глобальный ключ для управления состоянием формы
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для управления текстом в полях ввода
  final _emailController = TextEditingController();    // Для поля email
  final _passwordController = TextEditingController(); // Для поля пароля

  // Узлы фокуса для управления переходом между полями ввода
  final _emailFocusNode = FocusNode();    // Фокус для поля email
  final _passwordFocusNode = FocusNode(); // Фокус для поля пароля

  // Метод очистки ресурсов при уничтожении виджета
  @override
  void dispose() {
    // Освобождаем все контроллеры для предотвращения утечек памяти
    _emailController.dispose();
    _passwordController.dispose();

    // Освобождаем все узлы фокуса
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    // Вызываем метод dispose родительского класса
    super.dispose();
  }

  // Метод обработки входа пользователя
  void _login() {
    // Проверяем валидность всех полей формы
    if (_formKey.currentState!.validate()) {
      // Если валидация успешна - переходим на главную страницу
      // Навигация на главную страницу с антивирусами
      Navigator.pushReplacement(
        context,
        // Создаем маршрут к странице антивирусов
        MaterialPageRoute(builder: (context) => AntivirusPage()),
      );
    }
  }

  // Построение интерфейса страницы входа
  @override
  Widget build(BuildContext context) {
    // Базовый виджет Material Design для страницы
    return Scaffold(
      // Цвет фона всей страницы - белый
      backgroundColor: Colors.white,
      // Основное содержимое страницы
      body: SafeArea(
        // SafeArea обеспечивает отступы от выемок и динамического островка
        child: SingleChildScrollView(
          // Прокручиваемый контейнер для предотвращения переполнения экрана
          padding: EdgeInsets.all(24), // Отступы со всех сторон 24 пикселя
          child: Form(
            // Форма для группировки полей ввода и валидации
            key: _formKey, // Привязываем глобальный ключ к форме
            child: Column(
              // Вертикальное расположение виджетов
              crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание по левому краю
              children: [
                // Пустое пространство сверху (40 пикселей)
                SizedBox(height: 40),

                // Основной заголовок страницы
                Text(
                  'Добро пожаловать!',
                  style: TextStyle(
                    fontSize: 28, // Крупный шрифт
                    fontWeight: FontWeight.bold, // Жирное начертание
                    color: Colors.blue[800], // Темно-синий цвет
                  ),
                ),

                // Отступ после заголовка (8 пикселей)
                SizedBox(height: 8),

                // Подзаголовок с пояснением
                Text(
                  'Войдите в свой аккаунт\nИли создайте новый', // \n - перенос строки
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600], // Серый цвет текста
                  ),
                ),

                // Большой отступ перед полями ввода
                SizedBox(height: 40),

                // Кастомное поле ввода для email
                CustomTextField(
                  controller: _emailController, // Контроллер для email
                  labelText: 'Email', // Метка поля
                  keyboardType: TextInputType.emailAddress, // Тип клавиатуры - для email
                  focusNode: _emailFocusNode, // Узел фокуса для этого поля
                  nextFocusNode: _passwordFocusNode, // Следующее поле для фокуса (пароль)
                  prefixIcon: Icons.email, // Иконка email
                ),

                // Отступ между полями ввода
                SizedBox(height: 20),

                // Кастомное поле ввода для пароля
                CustomTextField(
                  controller: _passwordController, // Контроллер для пароля
                  labelText: 'Пароль', // Метка поля
                  keyboardType: TextInputType.visiblePassword, // Тип клавиатуры - для пароля
                  isPassword: true, // Флаг что это поле пароля (скрывает ввод)
                  focusNode: _passwordFocusNode, // Узел фокуса для этого поля
                  // nextFocusNode не указан - последнее поле, будет кнопка "Войти"
                  prefixIcon: Icons.lock, // Иконка замка
                ),

                // Небольшой отступ после поля пароля
                SizedBox(height: 16),

                // Кнопка "Забыли пароль?" выровненная по правому краю
                Align(
                  alignment: Alignment.centerRight, // Выравнивание по правому краю
                  child: TextButton(
                    onPressed: () {
                      // Забыли пароль - обработчик пока не реализован
                      // В будущем здесь можно добавить функциональность восстановления пароля
                    },
                    child: Text(
                      'Забыли пароль?',
                      style: TextStyle(color: Colors.blue), // Синий цвет текста
                    ),
                  ),
                ),

                // Отступ перед кнопкой входа
                SizedBox(height: 24),

                // Кнопка входа - занимает всю ширину
                SizedBox(
                  width: double.infinity, // Занимает всю доступную ширину
                  height: 50, // Фиксированная высота 50 пикселей
                  child: ElevatedButton(
                    onPressed: _login, // Обработчик нажатия - метод _login
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Синий цвет кнопки
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Скругленные углы 12px
                      ),
                    ),
                    child: Text(
                      'Войти',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Белый цвет текста
                      ),
                    ),
                  ),
                ),

                // Отступ после кнопки входа
                SizedBox(height: 24),

                // Ссылка для перехода на страницу регистрации
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Навигация на страницу регистрации
                      Navigator.push(
                        context,
                        // Создаем маршрут к странице регистрации
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Нет аккаунта? Зарегистрируйтесь',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue, // Синий цвет текста
                        fontWeight: FontWeight.bold, // Полужирное начертание
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
// Импорт основного пакета Flutter для работы с виджетами
import 'package:flutter/material.dart';

// Импорт файла с маршрутами приложения
import '../routes.dart';

// Импорт кастомного виджета текстового поля
import '../widgets/text_field.dart';

// Импорт страницы регистрации для навигации
import 'register_page.dart';

// Импорт главного файла приложения
import '../main.dart';

// Точка входа для тестирования этой страницы изолированно
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,  // Отключение дебаг баннера
    home: LoginPage(),  // Установка LoginPage как стартовой для тестирования
  ));
}

// Класс страницы входа как StatefulWidget (нужен для управления состоянием формы)
class LoginPage extends StatefulWidget {
  // Создание состояния для страницы входа
  @override
  _LoginPageState createState() => _LoginPageState();
}

// Класс состояния для страницы входа
class _LoginPageState extends State<LoginPage> {
  // Ключ для управления состоянием формы (валидация, сброс и т.д.)
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для управления текстом в полях ввода
  final _emailController = TextEditingController();  // Для поля email
  final _passwordController = TextEditingController();  // Для поля пароля

  // Узлы фокуса для управления переходом между полями ввода
  final _emailFocusNode = FocusNode();  // Фокус для поля email
  final _passwordFocusNode = FocusNode();  // Фокус для поля пароля

  // Метод очистки ресурсов при уничтожении виджета
  @override
  void dispose() {
    // Освобождение контроллеров для предотвращения утечек памяти
    _emailController.dispose();
    _passwordController.dispose();

    // Освобождение узлов фокуса
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    // Вызов метода dispose родительского класса
    super.dispose();
  }

  // Метод обработки входа пользователя
  void _login() {
    // Проверка валидности всех полей формы
    if (_formKey.currentState!.validate()) {
      // Навигация на главную страницу с заменой текущей (чтобы нельзя было вернуться назад к логину)
      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }

  // Построение интерфейса страницы входа
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Белый фон всей страницы
      backgroundColor: Colors.white,

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
                SizedBox(height: 40),

                // Основной заголовок страницы
                Text(
                  'Добро пожаловать!',  // Приветственный текст
                  style: TextStyle(
                    fontSize: 28,  // Крупный размер шрифта
                    fontWeight: FontWeight.bold,  // Жирное начертание
                    color: Colors.blue[800],  // Темно-синий цвет
                  ),
                ),

                // Отступ между заголовком и подзаголовком
                SizedBox(height: 8),

                // Подзаголовок с пояснением
                Text(
                  'Войдите в свой аккаунт\nИли создайте новый',  // Двустрочный текст
                  style: TextStyle(
                    fontSize: 16,  // Стандартный размер шрифта
                    color: Colors.grey[600],  // Серый цвет для второстепенного текста
                  ),
                ),

                // Отступ между текстом и полями ввода
                SizedBox(height: 40),

                // Кастомное поле ввода для email
                CustomTextField(
                  controller: _emailController,  // Контроллер для email
                  labelText: 'Email',  // Метка поля
                  keyboardType: TextInputType.emailAddress,  // Тип клавиатуры для email
                  focusNode: _emailFocusNode,  // Узел фокуса для этого поля
                  nextFocusNode: _passwordFocusNode,  // Следующее поле для фокуса (пароль)
                  prefixIcon: Icons.email,  // Иконка email
                ),

                // Отступ между полями
                SizedBox(height: 20),

                // Кастомное поле ввода для пароля
                CustomTextField(
                  controller: _passwordController,  // Контроллер для пароля
                  labelText: 'Пароль',  // Метка поля
                  keyboardType: TextInputType.visiblePassword,  // Тип клавиатуры для пароля
                  isPassword: true,  // Флаг что это поле пароля (будет скрывать текст)
                  focusNode: _passwordFocusNode,  // Узел фокуса для этого поля
                  prefixIcon: Icons.lock,  // Иконка замка
                ),

                // Отступ после поля пароля
                SizedBox(height: 16),

                // Кнопка "Забыли пароль?" выровненная по правому краю
                Align(
                  alignment: Alignment.centerRight,  // Выравнивание по правому краю
                  child: TextButton(
                    onPressed: () {
                      // Заглушка для функционала восстановления пароля
                      // В реальном приложении здесь была бы навигация на страницу восстановления
                    },
                    child: Text(
                      'Забыли пароль?',  // Текст кнопки
                      style: TextStyle(color: Colors.blue),  // Синий цвет текста
                    ),
                  ),
                ),

                // Отступ перед кнопкой входа
                SizedBox(height: 24),

                // Кнопка входа (занимает всю ширину)
                SizedBox(
                  width: double.infinity,  // Ширина на весь экран
                  height: 50,  // Фиксированная высота
                  child: ElevatedButton(
                    onPressed: _login,  // Обработчик нажатия - метод _login
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,  // Синий фон кнопки
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),  // Закругленные углы
                      ),
                    ),
                    child: Text(
                      'Войти',  // Текст на кнопке
                      style: TextStyle(
                        fontSize: 18,  // Размер шрифта
                        fontWeight: FontWeight.bold,  // Жирное начертание
                        color: Colors.white,  // Белый цвет текста
                      ),
                    ),
                  ),
                ),

                // Отступ после кнопки входа
                SizedBox(height: 24),

                // Кнопка перехода на страницу регистрации
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Навигация на страницу регистрации (без замены, чтобы можно было вернуться назад)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Нет аккаунта? Зарегистрируйтесь',  // Текст кнопки
                      style: TextStyle(
                        fontSize: 16,  // Размер шрифта
                        color: Colors.blue,  // Синий цвет текста
                        fontWeight: FontWeight.bold,  // Жирное начертание
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
// Импорт основного пакета Flutter для работы с виджетами
import 'package:flutter/material.dart';

// Импорт файла с маршрутами приложения
import '../routes.dart';

// Импорт кастомного виджета текстового поля
import '../widgets/text_field.dart';

// Импорт страницы входа для навигации
import 'login_page.dart';

// Импорт главного файла приложения (переименован для избежания конфликта)
import '../main.dart' as main_app;

// Точка входа для тестирования этой страницы изолированно
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,  // Отключение дебаг баннера
    home: RegisterPage(),  // Установка RegisterPage как стартовой
  ));
}

// Класс страницы регистрации как StatefulWidget
class RegisterPage extends StatefulWidget {
  // Создание состояния для страницы регистрации
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

// Класс состояния для страницы регистрации
class _RegisterPageState extends State<RegisterPage> {
  // Ключ для управления состоянием формы (валидация, сброс и т.д.)
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для управления текстом в полях ввода
  final _nameController = TextEditingController();  // Для поля ФИО
  final _emailController = TextEditingController();  // Для поля email
  final _passwordController = TextEditingController();  // Для поля пароля
  final _confirmPasswordController = TextEditingController();  // Для подтверждения пароля

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

  // Метод обработки регистрации пользователя
  void _register() {
    // Проверка валидности всех полей формы
    if (_formKey.currentState!.validate()) {
      // Дополнительная проверка совпадения паролей
      if (_passwordController.text != _confirmPasswordController.text) {
        // Показ сообщения об ошибке если пароли не совпадают
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пароли не совпадают')),
        );
        return;  // Прерывание выполнения если пароли не совпали
      }

      // Навигация на главную страницу с заменой текущей (чтобы нельзя было вернуться назад)
      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }

  // Построение интерфейса страницы регистрации
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Верхняя панель навигации
      appBar: AppBar(
        title: Text('Регистрация'),  // Заголовок страницы
        backgroundColor: Colors.blue,  // Синий фон аппбара
        foregroundColor: Colors.white,  // Белый цвет текста и иконок
      ),

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
                SizedBox(height: 20),

                // Заголовок формы регистрации
                Text(
                  'Регистрация',
                  style: TextStyle(
                    fontSize: 24,  // Размер шрифта
                    fontWeight: FontWeight.bold,  // Жирное начертание
                    color: Colors.blue[800],  // Темно-синий цвет
                  ),
                ),

                // Отступ между заголовком и полями ввода
                SizedBox(height: 30),

                // Кастомное поле ввода для ФИО
                CustomTextField(
                  controller: _nameController,  // Контроллер для ФИО
                  labelText: 'ФИО',  // Метка поля
                  keyboardType: TextInputType.name,  // Тип клавиатуры для имени
                  focusNode: _nameFocusNode,  // Узел фокуса для этого поля
                  nextFocusNode: _emailFocusNode,  // Следующее поле для фокуса
                  prefixIcon: Icons.person,  // Иконка человека
                ),

                // Отступ между полями
                SizedBox(height: 20),

                // Кастомное поле ввода для email
                CustomTextField(
                  controller: _emailController,  // Контроллер для email
                  labelText: 'Email',  // Метка поля
                  keyboardType: TextInputType.emailAddress,  // Тип клавиатуры для email
                  focusNode: _emailFocusNode,  // Узел фокуса для этого поля
                  nextFocusNode: _passwordFocusNode,  // Следующее поле для фокуса
                  prefixIcon: Icons.email,  // Иконка email
                ),

                // Отступ между полями
                SizedBox(height: 20),

                // Кастомное поле ввода для пароля
                CustomTextField(
                  controller: _passwordController,  // Контроллер для пароля
                  labelText: 'Пароль',  // Метка поля
                  keyboardType: TextInputType.visiblePassword,  // Тип клавиатуры для пароля
                  isPassword: true,  // Флаг что это поле пароля
                  focusNode: _passwordFocusNode,  // Узел фокуса для этого поля
                  nextFocusNode: _confirmPasswordFocusNode,  // Следующее поле для фокуса
                  prefixIcon: Icons.lock,  // Иконка замка
                ),

                // Отступ между полями
                SizedBox(height: 20),

                // Кастомное поле ввода для подтверждения пароля
                CustomTextField(
                  controller: _confirmPasswordController,  // Контроллер для подтверждения пароля
                  labelText: 'Повторите пароль',  // Метка поля
                  keyboardType: TextInputType.visiblePassword,  // Тип клавиатуры для пароля
                  isPassword: true,  // Флаг что это поле пароля
                  focusNode: _confirmPasswordFocusNode,  // Узел фокуса для этого поля
                  prefixIcon: Icons.lock_outline,  // Иконка замка (контурная)
                ),

                // Отступ перед кнопкой регистрации
                SizedBox(height: 30),

                // Кнопка регистрации (занимает всю ширину)
                SizedBox(
                  width: double.infinity,  // Ширина на весь экран
                  height: 50,  // Фиксированная высота
                  child: ElevatedButton(
                    onPressed: _register,  // Обработчик нажатия - метод _register
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,  // Синий фон кнопки
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),  // Закругленные углы
                      ),
                    ),
                    child: Text(
                      'Зарегистрироваться',  // Текст на кнопке
                      style: TextStyle(
                        fontSize: 18,  // Размер шрифта
                        fontWeight: FontWeight.bold,  // Жирное начертание
                        color: Colors.white,  // Белый цвет текста
                      ),
                    ),
                  ),
                ),

                // Отступ после кнопки регистрации
                SizedBox(height: 20),

                // Кнопка перехода на страницу входа
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Навигация на страницу входа с заменой текущей
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Уже есть аккаунт? Войдите',  // Текст кнопки
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
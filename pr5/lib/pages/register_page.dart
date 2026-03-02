// Импорт основной библиотеки Flutter
import 'package:flutter/material.dart';
// Импорт кастомного виджета текстового поля
import '../widgets/text_field.dart';
// Импорт страницы входа для навигации
import 'login_page.dart';
// Импорт главного файла приложения под псевдонимом (чтобы избежать конфликта имен)
import '../main.dart' as main_app;

// Точка входа для этого файла (может использоваться для тестирования)
void main() {
  // Запуск приложения с начальной страницей регистрации
  runApp(MaterialApp(
    // Убираем баннер "DEBUG" в углу
    debugShowCheckedModeBanner: false,
    // Устанавливаем RegisterPage как стартовый экран
    home: RegisterPage(),
  ));
}

// Страница регистрации - StatefulWidget так как содержит форму с состоянием
class RegisterPage extends StatefulWidget {
  // Создание состояния для страницы
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

// Класс состояния для страницы регистрации
class _RegisterPageState extends State<RegisterPage> {
  // Глобальный ключ для управления состоянием формы
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для управления текстом в полях ввода
  final _nameController = TextEditingController();        // Для поля ФИО
  final _emailController = TextEditingController();       // Для поля email
  final _passwordController = TextEditingController();    // Для поля пароля
  final _confirmPasswordController = TextEditingController(); // Для поля подтверждения пароля

  // Узлы фокуса для управления переходом между полями
  final _nameFocusNode = FocusNode();           // Фокус для поля ФИО
  final _emailFocusNode = FocusNode();          // Фокус для поля email
  final _passwordFocusNode = FocusNode();       // Фокус для поля пароля
  final _confirmPasswordFocusNode = FocusNode(); // Фокус для поля подтверждения пароля

  // Метод очистки ресурсов при уничтожении виджета
  @override
  void dispose() {
    // Освобождаем все контроллеры для предотвращения утечек памяти
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    // Освобождаем все узлы фокуса
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();

    // Вызываем метод dispose родительского класса
    super.dispose();
  }

  // Метод обработки регистрации пользователя
  void _register() {
    // Проверяем валидность всех полей формы
    if (_formKey.currentState!.validate()) {
      // Дополнительная проверка: совпадают ли пароли
      if (_passwordController.text != _confirmPasswordController.text) {
        // Показываем сообщение об ошибке если пароли не совпадают
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Пароли не совпадают')),
        );
        return; // Прерываем выполнение метода
      }

      // Навигация на главную страницу с антивирусами
      // pushReplacement заменяет текущий маршрут, чтобы нельзя было вернуться назад
      Navigator.pushReplacement(
        context,
        // Создаем маршрут к главной странице приложения
        MaterialPageRoute(builder: (context) => main_app.AntivirusPage()),
      );
    }
  }

  // Построение интерфейса страницы
  @override
  Widget build(BuildContext context) {
    // Базовый виджет Material Design для страницы
    return Scaffold(
      // Верхняя панель приложения
      appBar: AppBar(
        title: Text('Регистрация'), // Заголовок страницы
        backgroundColor: Colors.blue, // Цвет фона AppBar
        foregroundColor: Colors.white, // Цвет текста и иконок
      ),
      // Цвет фона всей страницы
      backgroundColor: Colors.white,
      // Основное содержимое страницы
      body: SafeArea(
        // SafeArea обеспечивает отступы от выемок и динамического островка
        child: SingleChildScrollView(
          // Прокручиваемый контейнер для предотвращения переполнения экрана
          padding: EdgeInsets.all(24), // Отступы со всех сторон
          child: Form(
            // Форма для группировки полей ввода и валидации
            key: _formKey, // Привязываем глобальный ключ к форме
            child: Column(
              // Вертикальное расположение виджетов
              crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание по левому краю
              children: [
                // Пустое пространство сверху
                SizedBox(height: 20),

                // Заголовок "Регистрация"
                Text(
                  'Регистрация',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800], // Темно-синий цвет
                  ),
                ),

                // Отступ после заголовка
                SizedBox(height: 30),

                // Кастомное поле ввода для ФИО
                CustomTextField(
                  controller: _nameController, // Контроллер для ФИО
                  labelText: 'ФИО', // Метка поля
                  keyboardType: TextInputType.name, // Тип клавиатуры - для имен
                  focusNode: _nameFocusNode, // Узел фокуса для этого поля
                  nextFocusNode: _emailFocusNode, // Следующее поле для фокуса
                  prefixIcon: Icons.person, // Иконка пользователя
                ),

                // Отступ между полями
                SizedBox(height: 20),

                // Поле ввода для email
                CustomTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress, // Клавиатура для email
                  focusNode: _emailFocusNode,
                  nextFocusNode: _passwordFocusNode, // Переход к паролю
                  prefixIcon: Icons.email, // Иконка email
                ),

                SizedBox(height: 20),

                // Поле ввода для пароля
                CustomTextField(
                  controller: _passwordController,
                  labelText: 'Пароль',
                  keyboardType: TextInputType.visiblePassword, // Клавиатура для пароля
                  isPassword: true, // Флаг что это поле пароля
                  focusNode: _passwordFocusNode,
                  nextFocusNode: _confirmPasswordFocusNode, // Переход к подтверждению пароля
                  prefixIcon: Icons.lock, // Иконка замка
                ),

                SizedBox(height: 20),

                // Поле для подтверждения пароля
                CustomTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Повторите пароль',
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true, // Также скрывает ввод
                  focusNode: _confirmPasswordFocusNode,
                  // nextFocusNode не указан - последнее поле, будет кнопка "Готово"
                  prefixIcon: Icons.lock_outline, // Иконка незаполненного замка
                ),

                // Отступ перед кнопкой регистрации
                SizedBox(height: 30),

                // Кнопка регистрации
                SizedBox(
                  width: double.infinity, // Занимает всю доступную ширину
                  height: 50, // Фиксированная высота
                  child: ElevatedButton(
                    onPressed: _register, // Обработчик нажатия - метод _register
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Синий цвет кнопки
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Скругленные углы
                      ),
                    ),
                    child: Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Белый текст
                      ),
                    ),
                  ),
                ),

                // Отступ после кнопки
                SizedBox(height: 20),

                // Ссылка для перехода на страницу входа
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Переход на страницу входа с заменой маршрута
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Уже есть аккаунт? Войдите',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue, // Синий цвет текста
                        fontWeight: FontWeight.bold,
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
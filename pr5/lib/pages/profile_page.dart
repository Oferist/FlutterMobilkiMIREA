// Импорт основной библиотеки Flutter
import 'package:flutter/material.dart';
// Импорт кастомного виджета текстового поля
import '../widgets/text_field.dart';
// Импорт главного файла приложения под псевдонимом для навигации
import '../main.dart' as main_app;

// Точка входа для тестирования этой страницы отдельно
void main() {
  runApp(MaterialApp(
    // Убираем баннер "DEBUG" в углу экрана
    debugShowCheckedModeBanner: false,
    // Устанавливаем ProfilePage как стартовый экран (для тестирования)
    home: ProfilePage(),
  ));
}

// Страница профиля пользователя - StatefulWidget так как содержит редактируемую форму
class ProfilePage extends StatefulWidget {
  // Создание состояния для страницы профиля
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

// Класс состояния для страницы профиля
class _ProfilePageState extends State<ProfilePage> {
  // Глобальный ключ для управления состоянием формы
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для управления текстом в полях ввода
  // text параметр задает начальное значение для полей
  final _nameController = TextEditingController(text: 'Иванов Иван Иванович'); // Предзаполненное ФИО
  final _emailController = TextEditingController(text: 'test123@mail.ru');     // Предзаполненный email
  final _passwordController = TextEditingController();                         // Пустой пароль
  final _confirmPasswordController = TextEditingController();                  // Пустое подтверждение пароля

  // Узлы фокуса для управления переходом между полями ввода
  final _nameFocusNode = FocusNode();           // Фокус для поля ФИО
  final _emailFocusNode = FocusNode();          // Фокус для поля email
  final _passwordFocusNode = FocusNode();       // Фокус для поля пароля
  final _confirmPasswordFocusNode = FocusNode(); // Фокус для подтверждения пароля

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

  // Метод сохранения профиля пользователя
  void _saveProfile() {
    // Проверяем валидность всех полей формы
    if (_formKey.currentState!.validate()) {
      // Проверяем, заполнено ли поле пароля и совпадают ли пароли
      // isNotEmpty проверяет что поле пароля не пустое
      if (_passwordController.text.isNotEmpty &&
          _passwordController.text != _confirmPasswordController.text) {
        // Показываем сообщение об ошибке если пароли не совпадают
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Пароли не совпадают')),
        );
        return; // Прерываем выполнение метода
      }

      // Если все проверки пройдены - показываем сообщение об успешном сохранении
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Профиль сохранен')),
      );
    }
  }

  // Метод выхода из профиля
  void _logout() {
    // Навигация на главную страницу приложения (MyApp)
    // pushReplacement заменяет текущий маршрут, чтобы нельзя было вернуться к профилю
    Navigator.pushReplacement(
      context,
      // Создаем маршрут к корневому виджету приложения
      MaterialPageRoute(builder: (context) => main_app.MyApp()),
    );
  }

  // Построение интерфейса страницы профиля
  @override
  Widget build(BuildContext context) {
    // Базовый виджет Material Design для страницы
    return Scaffold(
      // Верхняя панель приложения
      appBar: AppBar(
        title: Text('Профиль'), // Заголовок страницы
        backgroundColor: Colors.blue, // Цвет фона AppBar
        foregroundColor: Colors.white, // Цвет текста и иконок
        // Дополнительные действия в AppBar
        actions: [
          // Кнопка выхода в правой части AppBar
          IconButton(
            icon: Icon(Icons.logout), // Иконка выхода
            onPressed: _logout, // Обработчик нажатия - метод _logout
            tooltip: 'Выйти', // Подсказка при долгом нажатии
          ),
        ],
      ),
      // Цвет фона всей страницы
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
                // Пустое пространство сверху
                SizedBox(height: 20),

                // Аватар пользователя по центру
                Center(
                  child: CircleAvatar(
                    radius: 50, // Радиус круга 50 пикселей
                    backgroundColor: Colors.blue[100], // Светло-синий фон аватара
                    child: Icon(
                      Icons.person, // Иконка человека
                      size: 50, // Размер иконки
                      color: Colors.blue, // Синий цвет иконки
                    ),
                  ),
                ),

                // Отступ после аватара
                SizedBox(height: 30),

                // Заголовок "Профиль"
                Text(
                  'Профиль',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800], // Темно-синий цвет
                  ),
                ),

                // Отступ после заголовка
                SizedBox(height: 20),

                // Кастомное поле ввода для ФИО
                CustomTextField(
                  controller: _nameController, // Контроллер с предзаполненным ФИО
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
                  controller: _emailController, // Контроллер с предзаполненным email
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress, // Клавиатура для email
                  focusNode: _emailFocusNode,
                  nextFocusNode: _passwordFocusNode, // Переход к паролю
                  prefixIcon: Icons.email, // Иконка email
                ),

                SizedBox(height: 20),

                // Поле ввода для нового пароля (необязательное для изменения)
                CustomTextField(
                  controller: _passwordController, // Пустой контроллер
                  labelText: 'Пароль',
                  keyboardType: TextInputType.visiblePassword, // Клавиатура для пароля
                  isPassword: true, // Флаг что это поле пароля
                  focusNode: _passwordFocusNode,
                  nextFocusNode: _confirmPasswordFocusNode, // Переход к подтверждению пароля
                  prefixIcon: Icons.lock, // Иконка замка
                ),

                SizedBox(height: 20),

                // Поле для подтверждения нового пароля
                CustomTextField(
                  controller: _confirmPasswordController, // Пустой контроллер
                  labelText: 'Повторите пароль',
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true, // Также скрывает ввод
                  focusNode: _confirmPasswordFocusNode,
                  // nextFocusNode не указан - последнее поле перед кнопкой
                  prefixIcon: Icons.lock_outline, // Иконка незаполненного замка
                ),

                // Отступ перед кнопкой сохранения
                SizedBox(height: 30),

                // Кнопка сохранения профиля
                SizedBox(
                  width: double.infinity, // Занимает всю доступную ширину
                  height: 50, // Фиксированная высота
                  child: ElevatedButton(
                    onPressed: _saveProfile, // Обработчик нажатия - метод _saveProfile
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Синий цвет кнопки
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Скругленные углы
                      ),
                    ),
                    child: Text(
                      'Сохранить',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Белый текст
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
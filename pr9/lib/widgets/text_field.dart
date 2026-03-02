// Импорт основного пакета Flutter для работы с виджетами
import 'package:flutter/material.dart';

// Создание пользовательского текстового поля как StatefulWidget
// StatefulWidget нужен потому что поле может менять состояние (видимость пароля)
class CustomTextField extends StatefulWidget {
  // Контроллер для управления текстом в поле ввода
  final TextEditingController controller;

  // Текст метки (подсказки) над полем ввода
  final String labelText;

  // Тип клавиатуры для ввода (текст, email, цифры и т.д.)
  final TextInputType keyboardType;

  // Флаг указывает, является ли поле паролем
  final bool isPassword;

  // Узел фокуса для управления фокусом ввода
  final FocusNode focusNode;

  // Следующий узел фокуса (опциональный) для перехода к следующему полю
  final FocusNode? nextFocusNode;

  // Иконка, отображаемая перед полем ввода
  final IconData prefixIcon;

  // Конструктор виджета с обязательными и опциональными параметрами
  const CustomTextField({
    Key? key,  // Ключ для идентификации виджета в дереве
    required this.controller,  // Обязательный параметр - контроллер
    required this.labelText,   // Обязательный параметр - текст метки
    required this.keyboardType, // Обязательный параметр - тип клавиатуры
    this.isPassword = false,   // По умолчанию поле не является паролем
    required this.focusNode,   // Обязательный параметр - узел фокуса
    this.nextFocusNode,        // Опциональный параметр - следующий узел фокуса
    required this.prefixIcon,  // Обязательный параметр - иконка
  }) : super(key: key);  // Вызов конструктора родительского класса

  // Создание состояния для StatefulWidget
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

// Класс состояния для CustomTextField
class _CustomTextFieldState extends State<CustomTextField> {
  // Переменная для отслеживания видимости текста пароля
  bool _obscureText = true;

  // Метод валидации введенных данных
  String? _validateField(String? value) {
    // Проверка на пустое поле
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    }

    // Валидация для поля "Имя" - только буквы и пробелы
    if (widget.labelText.toLowerCase().contains('имя')) {
      // Регулярное выражение для проверки имени
      final nameRegex = RegExp(r'^[a-zA-Zа-яА-ЯёЁ\s]+$');
      if (!nameRegex.hasMatch(value)) {
        return 'Имя может содержать только буквы и пробелы';
      }
    }

    // Валидация для email поля
    if (widget.labelText.toLowerCase().contains('email')) {
      // Регулярное выражение для проверки email
      final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      if (!emailRegex.hasMatch(value)) {
        return 'Введите корректный email';
      }
    }

    // Валидация для поля пароля
    if (widget.isPassword) {
      // Проверка минимальной длины пароля
      if (value.length < 6) {
        return 'Пароль должен содержать не менее 6 символов';
      }
      // Проверка сложности пароля: буквы, цифры и специальные символы
      final passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[+_-]).+$');
      if (!passwordRegex.hasMatch(value)) {
        return 'Пароль должен содержать буквы, цифры и символы (+, _, -)';
      }
    }

    // Если все проверки пройдены - возвращаем null (ошибок нет)
    return null;
  }

  // Построение интерфейса виджета
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // Привязка контроллера для управления текстом
      controller: widget.controller,

      // Привязка узла фокуса для управления фокусом ввода
      focusNode: widget.focusNode,

      // Установка типа клавиатуры
      keyboardType: widget.keyboardType,

      // Скрытие текста если это поле пароля и включен режим скрытия
      obscureText: widget.isPassword && _obscureText,

      // Установка действия на клавиатуре: "Далее" или "Готово"
      textInputAction: widget.nextFocusNode != null ? TextInputAction.next : TextInputAction.done,

      // Обработчик нажатия кнопки "Далее" на клавиатуре
      onFieldSubmitted: (_) {
        // Если есть следующее поле - переводим фокус на него
        if (widget.nextFocusNode != null) {
          widget.nextFocusNode!.requestFocus();
        }
      },

      // Настройка внешнего вида поля ввода
      decoration: InputDecoration(
        // Текст метки над полем
        labelText: widget.labelText,

        // Иконка слева от поля ввода
        prefixIcon: Icon(widget.prefixIcon),

        // Иконка справа (для пароля - переключение видимости)
        suffixIcon: widget.isPassword
            ? IconButton(
          // Динамическое изменение иконки в зависимости от состояния
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          // Обработчик нажатия на иконку
          onPressed: () {
            // Обновление состояния - переключение видимости пароля
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,  // Если не пароль - иконка справа не отображается

        // Настройка стандартной границы поля
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),  // Закругленные углы
        ),

        // Настройка границы когда поле в фокусе
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue, width: 2),  // Синяя рамка при фокусе
        ),
      ),

      // Привязка функции валидации к полю ввода
      validator: _validateField,
    );
  }
}
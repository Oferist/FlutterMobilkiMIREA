// Импорт основной библиотеки Flutter
import 'package:flutter/material.dart';

// Кастомное текстовое поле с расширенной функциональностью
// StatefulWidget - так как имеет изменяемое состояние (показать/скрыть пароль)
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
  // Следующий узел фокуса для перехода при нажатии "Далее"
  final FocusNode? nextFocusNode;
  // Иконка, отображаемая перед полем ввода
  final IconData prefixIcon;

  // Конструктор класса с обязательными и необязательными параметрами
  const CustomTextField({
    Key? key, // Ключ для идентификации виджета в дереве
    required this.controller, // Обязательный параметр - контроллер
    required this.labelText, // Обязательный параметр - текст метки
    required this.keyboardType, // Обязательный параметр - тип клавиатуры
    this.isPassword = false, // Необязательный параметр, по умолчанию false
    required this.focusNode, // Обязательный параметр - узел фокуса
    this.nextFocusNode, // Необязательный параметр - следующий узел фокуса
    required this.prefixIcon, // Обязательный параметр - иконка
  }) : super(key: key); // Вызов конструктора родительского класса

  // Создание состояния для StatefulWidget
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

// Класс состояния для CustomTextField
class _CustomTextFieldState extends State<CustomTextField> {
  // Переменная состояния для скрытия/отображения текста пароля
  bool _obscureText = true;

  // Метод валидации введенных данных
  // Возвращает строку с ошибкой или null если валидация успешна
  String? _validateField(String? value) {
    // Проверка на пустое поле
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    }

    // Валидация для поля "Имя" - проверяем по тексту метки
    if (widget.labelText.toLowerCase().contains('имя')) {
      // Регулярное выражение: только буквы и пробелы (русские и английские)
      final nameRegex = RegExp(r'^[a-zA-Zа-яА-ЯёЁ\s]+$');
      if (!nameRegex.hasMatch(value)) {
        return 'Имя может содержать только буквы и пробелы';
      }
    }

    // Валидация для email поля
    if (widget.labelText.toLowerCase().contains('email')) {
      // Регулярное выражение для проверки формата email
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
      // Регулярное выражение: должна быть хотя бы одна буква, одна цифра
      // и один из символов +, _, -
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
    // Возвращаем TextFormField - расширенную версию TextField с валидацией
    return TextFormField(
      // Контроллер для управления текстом
      controller: widget.controller,
      // Узел фокуса для этого поля
      focusNode: widget.focusNode,
      // Тип клавиатуры (email, текст, цифры и т.д.)
      keyboardType: widget.keyboardType,
      // Скрывать ли текст (для паролей)
      obscureText: widget.isPassword && _obscureText,
      // Действие кнопки "Далее/Готово" на клавиатуре
      textInputAction: widget.nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
      // Обработчик нажатия кнопки "Далее/Готово"
      onFieldSubmitted: (_) {
        // Если есть следующий узел фокуса - переводим фокус на него
        if (widget.nextFocusNode != null) {
          widget.nextFocusNode!.requestFocus();
        }
      },
      // Декорация поля ввода (оформление)
      decoration: InputDecoration(
        // Текст метки над полем
        labelText: widget.labelText,
        // Иконка перед полем ввода
        prefixIcon: Icon(widget.prefixIcon),
        // Иконка после поля ввода (для пароля - переключение видимости)
        suffixIcon: widget.isPassword
            ? IconButton(
          // Иконка меняется в зависимости от состояния _obscureText
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          // Обработчик нажатия на иконку
          onPressed: () {
            // Изменяем состояние - переключаем видимость пароля
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null, // Если не пароль - суффиксной иконки нет
        // Стандартная граница поля
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Скругленные углы
        ),
        // Граница когда поле в фокусе
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue, width: 2), // Синяя рамка при фокусе
        ),
      ),
      // Функция валидации, вызывается при проверке формы
      validator: _validateField,
    );
  }
}
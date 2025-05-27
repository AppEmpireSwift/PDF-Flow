import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => PasswordPageState();
}

class PasswordPageState extends State<PasswordPage> {
  // Текущее состояние процесса ввода пароля (1-6)
  int currentState = 1;

  // Введенные символы пароля
  List<String> enteredPassword = [];

  // Подтвержденные символы пароля
  List<String> confirmedPassword = [];

  // Флаг несовпадения паролей
  bool passwordMismatch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
    onPressed: () {
      setState(() {
        if (currentState > 1) currentState--;
      });
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.only(left: 16.w), // Отступ слева
      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Уменьшает область нажатия
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min, // Чтобы Row занимал только нужное место
      children: [
        Icon(Icons.arrow_back, size: 24.w), // Иконка
        SizedBox(width: 15.w), // Отступ между иконкой и текстом
        Text(
          'Back',
          style: TextStyle(
            fontSize: 16.sp,
            color: Theme.of(context).appBarTheme.actionsIconTheme?.color, // Цвет как у иконок
          ),
        ),
      ],
    ),
  ),
        title: Text('Create password'),
        // currentState == 6
        //     ? null
        //     : Text(currentState == 1
        //         ? 'Создать пароль'
        //         : 'Повторите пароль'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (currentState) {
      case 1:
        return _buildEnterPasswordState(
          title: 'Enter code password',
          password: enteredPassword,
        );
      case 2:
        return buildPasswordMismatchState(title: 'Repeat the password');
      case 3:
        return _buildEnterPasswordState(
          title: 'Repeat the password',
          password: confirmedPassword,
        );
      case 4:
        return buildPasswordMismatchState(title: 'Repeat the password');
      case 5:
        return _buildPasswordSuccessState();
      case 6:
        return _buildPasswordAddedState();
      default:
        return _buildEnterPasswordState(
          title: 'Enter code password',
          password: enteredPassword,
        );
    }
  }

  Widget _buildEnterPasswordState({
    required String title,
    required List<String> password,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end, // Прижимаем элементы к низу
      children: [
        SizedBox(height: 24.h),
        Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24.h),
        // Индикаторы введенных символов (кружочки)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      index < password.length ? Colors.blue : Colors.grey[300],
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 132.h),
        // Клавиатура для ввода пароля
        _buildPasswordKeyboard(
          onKeyPressed: (value) {
            setState(() {
              if (password.length < 4) {
                password.add(value);
                if (password.length == 4) {
                  // В будущем: добавить логику проверки пароля
                  Future.delayed(const Duration(milliseconds: 500), () {
                    setState(() {
                      currentState = currentState == 1 ? 3 : 5;
                    });
                  });
                }
              }
            });
          },
          onBackspacePressed: () {
            setState(() {
              if (password.isNotEmpty) {
                password.removeLast();
              }
            });
          },
        ),
      ],
    );
  }

  Widget buildPasswordMismatchState({required String title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end, // Прижимаем элементы к низу
      children: [
        SizedBox(height: 24.h),
        Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        Center(
          child: Text(
            'Password does not match the one entered earlier',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        // Индикаторы неверного пароля
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 32.h),
        // Клавиатура для повторного ввода
        _buildPasswordKeyboard(
          onKeyPressed: (value) {
            setState(() {
              if (enteredPassword.length < 4) {
                enteredPassword.add(value);
                if (enteredPassword.length == 4) {
                  // В будущем: добавить логику сравнения паролей
                  Future.delayed(const Duration(milliseconds: 500), () {
                    setState(() {
                      currentState = 1; // Вернуться к первому шагу
                      enteredPassword.clear();
                      confirmedPassword.clear();
                    });
                  });
                }
              }
            });
          },
          onBackspacePressed: () {
            setState(() {
              if (enteredPassword.isNotEmpty) {
                enteredPassword.removeLast();
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildPasswordSuccessState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle, size: 64.w, color: Colors.green),
          SizedBox(height: 16.h),
          Text(
            'Пароль установлен',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            'Вы установили пароль для PDF_File_3456789_234.pdf',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentState = 6;
              });
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordAddedState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.lock_outline, size: 64.w, color: Colors.blue),
          SizedBox(height: 16.h),
          Text(
            'Пароль добавлен',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordKeyboard({
    required Function(String) onKeyPressed,
    required Function() onBackspacePressed,
  }) {
    // Клавиши с цифрами и символами
    final keys = [
      {'1': ''},
      {'2': 'АБВГ'},
      {'3': 'ДЕЖЗ'},
      {'4': 'ИЙКЛ'},
      {'5': 'MH0П'},
      {'6': 'PCTY'},
      {'7': 'ФХЦЧ'},
      {'8': 'ШЩЪЫ'},
      {'9': 'bЭЮЯ'},
    ];

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1.5,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      children: [
        ...keys.map((key) {
          final digit = key.keys.first;
          final symbols = key.values.first;
          return _buildKey(
            digit: digit,
            symbols: symbols,
            onPressed: () => onKeyPressed(digit),
          );
        }),
        // Кнопка удаления
        _buildBackspaceKey(onPressed: onBackspacePressed),
        // Кнопка подтверждения
        _buildConfirmKey(
          onPressed: () {
            // В будущем: добавить логику подтверждения
          },
        ),
      ],
    );
  }

  Widget _buildKey({
    required String digit,
    required String symbols,
    required Function() onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            digit,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          Text(symbols, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }

  Widget _buildBackspaceKey({required Function() onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.backspace, size: 28.w),
    );
  }

  Widget _buildConfirmKey({required Function() onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.check, size: 28.w, color: Colors.green),
    );
  }
}

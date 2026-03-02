import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Антивирусы',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AntivirusPage(),
    );
  }
}

class AntivirusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Антивирусы'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Главный заголовок
            Center(
              child: Text(
                'Популярные антивирусы',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Название ПО
            Text(
              'Антивирусное программное обеспечение',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Описание ПО
            Text(
              'Антивирусы - это программы для обнаружения, предотвращения и удаления '
                  'вредоносного программного обеспечения. Они защищают компьютеры и мобильные '
                  'устройства от вирусов, троянов, шпионского ПО, ransomware и других угроз.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Картинка и список на одном уровне (Row)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Картинка слева
                Image.network(
                  'https://img.icons8.com/color/256/antivirus-scanner.png',
                  width: 120,
                  height: 120,
                ),
                SizedBox(width: 20),

                // Список справа
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Популярные антивирусы:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('1. Kaspersky Internet Security'),
                      Text('2. Norton Antivirus'),
                      Text('3. Avast Free Antivirus'),
                      Text('4. Bitdefender Total Security'),
                      Text('5. ESET NOD32 Antivirus'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Картинка пустого человека и ФИО+группа на одном уровне
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Картинка пустого человека
                Image.network(
                  'https://img.icons8.com/ios-filled/50/user-male-circle.png',
                  width: 60,
                  height: 60,
                ),
                SizedBox(width: 10),

                // ФИО и номер группы
                Text(
                  'Некрасов Г.А., Группа ИКБО-28-22',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
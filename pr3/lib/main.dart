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
        // Используем встроенный декоративный шрифт
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'serif', // Встроенный шрифт с засечками
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic, // Курсив для декоративности
          ),
        ),
      ),
      home: AntivirusPage(),
    );
  }
}

class AntivirusPage extends StatefulWidget {
  @override
  _AntivirusPageState createState() => _AntivirusPageState();
}

class _AntivirusPageState extends State<AntivirusPage> {
  final List<String> antivirusImages = [
    'https://img.icons8.com/color/256/antivirus-scanner.png',
    'https://img.icons8.com/color/256/security-checked.png',
    'https://img.icons8.com/color/256/shield.png',
    'https://img.icons8.com/color/256/cyber-security.png',
    'https://img.icons8.com/color/256/security-configuration.png',
  ];

  int currentImageIndex = 0;

  void changeImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % antivirusImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'АНТИВИРУСЫ',
          style: TextStyle(
            fontFamily: 'serif', // Встроенный шрифт с засечками
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic, // Делаем курсивным
            letterSpacing: 2.0,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 4.0,
                color: Colors.black.withOpacity(0.5),
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Главный заголовок
            Center(
              child: Text(
                'ПОПУЛЯРНЫЕ АНТИВИРУСЫ',
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue[800],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Название ПО
            Text(
              'Антивирусное программное обеспечение',
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 10),

            // Описание ПО
            Text(
              'Антивирусы - это программы для обнаружения, предотвращения и удаления '
                  'вредоносного программного обеспечения. Они защищают компьютеры и мобильные '
                  'устройства от вирусов, троянов, шпионского ПО, ransomware и других угроз.',
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),

            // Картинка и список на одном уровне
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Интерактивная картинка
                GestureDetector(
                  onTap: changeImage,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.network(
                      antivirusImages[currentImageIndex],
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),

                // Список антивирусов
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Популярные антивирусы:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
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
            SizedBox(height: 30),

            // ФИО и группа
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://img.icons8.com/ios-filled/50/user-male-circle.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Некрасов Г.А., Группа ИКБО-28-22',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
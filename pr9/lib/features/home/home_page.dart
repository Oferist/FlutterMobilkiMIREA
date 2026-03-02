// lib/features/home/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

import '../../../routes.dart';
import '../../../pages/detail_page.dart';
import '../../../pages/profile_page.dart';
import '../../../models/antivirus.dart';
import '../../di.dart';
import 'bloc/home_bloc.dart';
import '../../theme/theme_toggle_action.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = getIt<HomeBloc>(); // Получаем из DI-контейнера
    _homeBloc.add(LoadAntivirusDataEvent());
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.pushNamed(context, Routes.profile);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _getCurrentScreen() {
    switch (_selectedIndex) {
      case 0:
        return _AntivirusContent(homeBloc: _homeBloc);
      case 1:
        return const Center(child: Text('Поиск антивирусов...'));
      default:
        return _AntivirusContent(homeBloc: _homeBloc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'АНТИВИРУСЫ',
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              letterSpacing: 2.0,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 4.0,
                  color: Colors.black,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
          centerTitle: true,
//          backgroundColor: Colors.blue[800],
          actions: [
            // --- ДОБАВЛЕНА КНОПКА СМЕНЫ ТЕМЫ ---
            const ThemeToggleAction(),

            IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, Routes.profile);
              },
              tooltip: 'Профиль',
            ),
          ],
        ),
        body: _getCurrentScreen(),
        bottomNavigationBar: NavigationBar(
          // backgroundColor: Colors.deepPurple.shade50,
          // indicatorColor: Colors.deepPurple.shade100,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          animationDuration: const Duration(milliseconds: 500),
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Главная',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: 'Поиск',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Профиль',
            ),
          ],
        ),
      ),
    );
  }
}

class _AntivirusContent extends StatelessWidget {
  final HomeBloc homeBloc;

  const _AntivirusContent({required this.homeBloc});

  double get _platformPadding {
    if (kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      return 50;
    }
    return 20;
  }

  void _navigateToDetail(Antivirus antivirus, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(antivirus: _convertToMap(antivirus)),
      ),
    );
  }

  Map<String, dynamic> _convertToMap(Antivirus antivirus) {
    return {
      'name': antivirus.name,
      'description': antivirus.description,
      'icon': Icons.security,
      'color': antivirus.color,
    };
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bool isWideScreen = mediaQuery.size.width > 600;

    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(_platformPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Антивирусное программное обеспечение',
                style: TextStyle(
                  fontSize: isWideScreen ? 24 : 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: _platformPadding),

              Text(
                'Антивирусы - это программы для обнаружения, предотвращения и удаления '
                    'вредоносного программного обеспечения. Они защищают компьютеры и мобильные '
                    'устройства от вирусов, троянов, шпионского ПО, ransomware и других угроз.',
                style: TextStyle(
                  fontSize: isWideScreen ? 18 : 16,
                  height: 1.4,
                ),
              ),
              SizedBox(height: _platformPadding),

              // Состояния BLoC
              if (state is HomeLoading) ...[
                _buildLoadingState(),
              ] else if (state is HomeError) ...[
                _buildErrorState(state, context),
              ] else if (state is HomeLoaded) ...[
                _buildLoadedState(state, isWideScreen, context),
              ] else ...[
                _buildInitialState(),
              ],

              _buildDeveloperInfo(isWideScreen),
              SizedBox(height: _platformPadding),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return const Column(
      children: [
        SizedBox(height: 100),
        Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Загрузка данных...'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(HomeError state, BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Center(
          child: Column(
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 20),
              Text(
                state.message,
                style: const TextStyle(fontSize: 16, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  homeBloc.add(LoadAntivirusDataEvent());
                },
                child: const Text('Повторить загрузку'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInitialState() {
    return const Column(
      children: [
        SizedBox(height: 100),
        Center(
          child: Text('Нажмите для загрузки данных'),
        ),
      ],
    );
  }

  Widget _buildLoadedState(HomeLoaded state, bool isWideScreen, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Типы защиты:',
          style: TextStyle(
            fontSize: isWideScreen ? 20 : 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.protectionTypes.length,
            itemBuilder: (context, index) {
              final protection = state.protectionTypes[index];
              return Container(
                margin: EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          protection['url']!,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.error, color: Colors.red, size: 40),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      protection['name']!,
                      style: TextStyle(
                        fontSize: isWideScreen ? 14 : 12,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: _platformPadding),

        Text(
          'Популярные антивирусы:',
          style: TextStyle(
            fontSize: isWideScreen ? 20 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
        SizedBox(height: 10),

        if (isWideScreen)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3,
            ),
            itemCount: state.antivirusList.length,
            itemBuilder: (context, index) {
              final antivirus = state.antivirusList[index];
              return _buildAntivirusCard(antivirus, isWideScreen, context);
            },
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.antivirusList.length,
            itemBuilder: (context, index) {
              final antivirus = state.antivirusList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildAntivirusCard(antivirus, isWideScreen, context),
              );
            },
          ),
      ],
    );
  }

  Widget _buildAntivirusCard(Antivirus antivirus, bool isWideScreen, BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: antivirus.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.network(
            antivirus.iconUrl,
            width: isWideScreen ? 32 : 28,
            height: isWideScreen ? 32 : 28,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.security, color: antivirus.color, size: isWideScreen ? 32 : 28);
            },
          ),
        ),
        title: Text(
          antivirus.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isWideScreen ? 18 : 16,
          ),
        ),
        subtitle: Text(
          antivirus.shortDescription,
          maxLines: isWideScreen ? 2 : 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: isWideScreen ? 20 : 18,
          ),
        ),
        onTap: () => _navigateToDetail(antivirus, context),
      ),
    );
  }

  Widget _buildDeveloperInfo(bool isWideScreen) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://img.icons8.com/ios-filled/50/user-male-circle.png',
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 8),
          Text(
            'Некрасов Г.А., Группа ИКБО-28-22',
            style: TextStyle(
              fontSize: isWideScreen ? 18 : 16,
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
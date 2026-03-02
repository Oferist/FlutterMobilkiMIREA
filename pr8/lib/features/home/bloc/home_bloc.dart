import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../data/repositories/antivirus_repository.dart';
import '../../../models/antivirus.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AntivirusRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadAntivirusDataEvent>(_onLoadAntivirusData);
  }

  Future<void> _onLoadAntivirusData(
      LoadAntivirusDataEvent event,
      Emitter<HomeState> emit,
      ) async {
    try {
      emit(HomeLoading());

      // Добавляем задержку для демонстрации загрузки
      await Future.delayed(const Duration(milliseconds: 500));

      final antivirusList = await repository.getAntivirusList();

      final protectionTypes = [
        {
          'url': 'https://img.icons8.com/color/256/antivirus-scanner.png',
          'name': 'Поиск вирусов'
        },
        {
          'url': 'https://img.icons8.com/color/256/security-checked.png',
          'name': 'Защита ПК'
        },
        {
          'url': 'https://img.icons8.com/color/256/shield.png',
          'name': 'Устранение угроз'
        },
        {
          'url': 'https://img.icons8.com/color/256/cyber-security.png',
          'name': 'Кибербезопасность'
        },
        {
          'url': 'https://img.icons8.com/color/256/security-configuration.png',
          'name': 'Настройки безопасности'
        },
      ];

      if (antivirusList.isEmpty) {
        emit(HomeError('Нет данных для отображения'));
        return;
      }

      emit(HomeLoaded(
        antivirusList: antivirusList,
        protectionTypes: protectionTypes,
      ));
    } catch (e) {
      print('Ошибка в BLoC: $e');
      emit(HomeError('Ошибка загрузки данных: ${e.toString()}'));
    }
  }
}
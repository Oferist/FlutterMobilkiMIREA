// lib/features/home/bloc/home_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../data/antivirus_data.dart';
import '../../../models/antivirus.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadAntivirusDataEvent>(_onLoadAntivirusData);
  }

  Future<void> _onLoadAntivirusData(
      LoadAntivirusDataEvent event,
      Emitter<HomeState> emit,
      ) async {
    try {
      emit(HomeLoading());

      await Future.delayed(const Duration(milliseconds: 1000));

      final antivirusList = AntivirusData.antivirusList;
      final protectionTypes = AntivirusData.protectionTypes;

      if (antivirusList.isEmpty) {
        emit(HomeError('Нет данных для отображения'));
        return;
      }

      emit(HomeLoaded(
        antivirusList: antivirusList,
        protectionTypes: protectionTypes,
      ));
    } catch (e) {
      emit(HomeError('Ошибка загрузки данных: $e'));
    }
  }
}
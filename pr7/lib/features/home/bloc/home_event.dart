// lib/features/home/bloc/home_event.dart
part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class LoadAntivirusDataEvent extends HomeEvent {}
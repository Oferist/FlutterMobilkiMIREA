part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Antivirus> antivirusList;
  final List<Map<String, String>> protectionTypes;

  HomeLoaded({
    required this.antivirusList,
    required this.protectionTypes,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeLoaded &&
        listEquals(other.antivirusList, antivirusList) &&
        listEquals(other.protectionTypes, protectionTypes);
  }

  @override
  int get hashCode => antivirusList.hashCode ^ protectionTypes.hashCode;
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeError &&
        other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
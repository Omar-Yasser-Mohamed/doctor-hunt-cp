part of 'find_doctors_bloc.dart';

sealed class FindDoctorsEvent extends Equatable {
  const FindDoctorsEvent();

  @override
  List<Object> get props => [];
}

class SearchForDoctorsEvent extends FindDoctorsEvent {
  final String query;

  const SearchForDoctorsEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class ClearSearchEvent extends FindDoctorsEvent {}

class LoadMoreDoctorsEvent extends FindDoctorsEvent {}

part of 'location_picker_bloc.dart';

sealed class LocationPickerEvent extends Equatable {
  const LocationPickerEvent();

  @override
  List<Object?> get props => [];
}

class MapTappedEvent extends LocationPickerEvent {
  final double latitude;
  final double longitude;

  const MapTappedEvent({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}

class GetCurrentLocationEvent extends LocationPickerEvent {
  const GetCurrentLocationEvent();
}

class SearchPlacesEvent extends LocationPickerEvent {
  final String query;

  const SearchPlacesEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

class SelectSearchResultEvent extends LocationPickerEvent {
  final LocationModel location;

  const SelectSearchResultEvent({required this.location});

  @override
  List<Object?> get props => [location];
}

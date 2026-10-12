part of 'location_picker_bloc.dart';

class LocationPickerState extends Equatable {
  final double? latitude;
  final double? longitude;
  final String? address;
  final bool isLoadingAddress;
  final bool isLoadingLocation;
  final List<LocationModel> searchResults;
  final bool isSearching;
  final Failure? failure;
  final bool shouldAnimateMap;

  const LocationPickerState({
    this.latitude,
    this.longitude,
    this.address,
    this.isLoadingAddress = false,
    this.isLoadingLocation = false,
    this.searchResults = const [],
    this.isSearching = false,
    this.failure,
    this.shouldAnimateMap = false,
  });

  bool get hasLocation => latitude != null && longitude != null;
  bool get canConfirm => hasLocation && address != null && !isLoadingAddress;

  LocationModel? get locationModel => hasLocation
      ? LocationModel(
          latitude: latitude!,
          longitude: longitude!,
          address: address ?? '',
        )
      : null;

  LocationPickerState copyWith({
    double? latitude,
    double? longitude,
    String? address,
    bool? isLoadingAddress,
    bool? isLoadingLocation,
    List<LocationModel>? searchResults,
    bool? isSearching,
    Failure? failure,
    bool clearFailure = false,
    bool? shouldAnimateMap,
  }) {
    return LocationPickerState(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      isLoadingAddress: isLoadingAddress ?? this.isLoadingAddress,
      isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
      searchResults: searchResults ?? this.searchResults,
      isSearching: isSearching ?? this.isSearching,
      failure: clearFailure ? null : (failure ?? this.failure),
      shouldAnimateMap: shouldAnimateMap ?? false,
    );
  }

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        address,
        isLoadingAddress,
        isLoadingLocation,
        searchResults,
        isSearching,
        failure,
        shouldAnimateMap,
      ];
}

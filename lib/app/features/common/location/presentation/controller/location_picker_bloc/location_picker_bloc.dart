import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/features/common/location/data/models/location_model.dart';
import 'package:doctor_hunt/app/features/common/location/data/repos/location_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'location_picker_event.dart';
part 'location_picker_state.dart';

EventTransformer<E> searchTransformer<E>({
  Duration duration = const Duration(milliseconds: 300),
}) {
  return (events, mapper) {
    return restartable<E>()(
      events.debounce(duration),
      mapper,
    );
  };
}

@injectable
class LocationPickerBloc
    extends Bloc<LocationPickerEvent, LocationPickerState> {
  final LocationRepo _locationRepo;

  LocationPickerBloc(this._locationRepo)
      : super(const LocationPickerState()) {
    on<MapTappedEvent>(_onMapTapped);
    on<GetCurrentLocationEvent>(_onGetCurrentLocation);
    on<SearchPlacesEvent>(
      _onSearchPlaces,
      transformer: searchTransformer(),
    );
    on<SelectSearchResultEvent>(_onSelectSearchResult);
  }

  Future<void> _onMapTapped(
    MapTappedEvent event,
    Emitter<LocationPickerState> emit,
  ) async {
    emit(state.copyWith(
      latitude: event.latitude,
      longitude: event.longitude,
      isLoadingAddress: true,
      clearFailure: true,
      shouldAnimateMap: false,
    ));

    final result = await _locationRepo.getAddressFromCoordinates(
      event.latitude,
      event.longitude,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingAddress: false,
        failure: failure,
      )),
      (address) => emit(state.copyWith(
        address: address,
        isLoadingAddress: false,
      )),
    );
  }

  Future<void> _onGetCurrentLocation(
    GetCurrentLocationEvent event,
    Emitter<LocationPickerState> emit,
  ) async {
    emit(state.copyWith(
      isLoadingLocation: true,
      clearFailure: true,
      shouldAnimateMap: false,
    ));

    final posResult = await _locationRepo.getCurrentPosition();

    await posResult.fold(
      (failure) async {
        emit(state.copyWith(
          isLoadingLocation: false,
          failure: failure,
        ));
      },
      (coords) async {
        emit(state.copyWith(
          latitude: coords.latitude,
          longitude: coords.longitude,
          isLoadingLocation: false,
          isLoadingAddress: true,
          shouldAnimateMap: true,
        ));

        final addressResult = await _locationRepo.getAddressFromCoordinates(
          coords.latitude,
          coords.longitude,
        );

        addressResult.fold(
          (failure) => emit(state.copyWith(
            isLoadingAddress: false,
            failure: failure,
          )),
          (address) => emit(state.copyWith(
            address: address,
            isLoadingAddress: false,
          )),
        );
      },
    );
  }

  Future<void> _onSearchPlaces(
    SearchPlacesEvent event,
    Emitter<LocationPickerState> emit,
  ) async {
    final query = event.query.trim();
    if (query.isEmpty) {
      emit(state.copyWith(
        searchResults: const [],
        isSearching: false,
      ));
      return;
    }

    emit(state.copyWith(
      isSearching: true,
      clearFailure: true,
      shouldAnimateMap: false,
    ));

    final result = await _locationRepo.searchPlaces(query);

    result.fold(
      (failure) => emit(state.copyWith(
        isSearching: false,
        failure: failure,
      )),
      (results) => emit(state.copyWith(
        searchResults: results,
        isSearching: false,
      )),
    );
  }

  void _onSelectSearchResult(
    SelectSearchResultEvent event,
    Emitter<LocationPickerState> emit,
  ) {
    emit(state.copyWith(
      latitude: event.location.latitude,
      longitude: event.location.longitude,
      address: event.location.address,
      searchResults: const [],
      clearFailure: true,
      shouldAnimateMap: true,
    ));
  }
}

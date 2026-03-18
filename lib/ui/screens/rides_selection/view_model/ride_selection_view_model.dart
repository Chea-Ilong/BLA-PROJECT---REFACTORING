import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preferences_state.dart';
import 'package:flutter/material.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferencesState ridePreferencesState;
  final RideRepository repository;

  RideSelectionViewModel({
    required this.ridePreferencesState,
    required this.repository,
  }) {
    ridePreferencesState.addListener(_onRidePrefStateChange);
  }

  RidePreference? get selectedRidePreference =>
      ridePreferencesState.selectedPreference;

  List<RidePreference> get preferenceHistory =>
      ridePreferencesState.preferenceHistory;

   List<Ride> get matchingRides =>
      getRidesFor(selectedRidePreference!);
  
   void selectPreference(RidePreference selectedPreference) {
    ridePreferencesState.selectPreference(selectedPreference);
  }

  List<Ride> getRidesFor(RidePreference preferences) {
    return repository.fetchRides()
        .where(
          (ride) =>
              ride.departureLocation == preferences.departure &&
              ride.arrivalLocation == preferences.arrival &&
              ride.availableSeats >= preferences.requestedSeats,
        )
        .toList();
  }

  void _onRidePrefStateChange() {
    notifyListeners();
  }

   @override
  void dispose() {
    ridePreferencesState.removeListener(_onRidePrefStateChange);
    super.dispose();
  }
}

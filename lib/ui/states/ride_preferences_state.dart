import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

///   This service handles:
///   - History of the last ride preferences        (to allow users to re-use their last preferences)
///   - Curent selected ride preferences.
///

// TODO Improve this with a proper repository and a global state
class RidePreferencesState extends ChangeNotifier {
  final RidePreferenceRepository _ridePreferenceRepository;
  RidePreference? _selectedPreference;
  final int maxAllowedSeats = 8;

  RidePreferencesState({required RidePreferenceRepository repository}
  
  )
    : _ridePreferenceRepository = repository;


  RidePreference? get selectedPreference => _selectedPreference;

  List<RidePreference> get preferenceHistory =>
      _ridePreferenceRepository.fetchRidePreferences();

  void selectPreference(RidePreference preference) {
    if (preference != _selectedPreference) {
      // Set the selected preference
      _selectedPreference = preference;

      // Push to history
      _addPreferenceToHistory(preference);
      notifyListeners();
    }
  }

  void _addPreferenceToHistory(RidePreference preference) {
    _ridePreferenceRepository.addPreferenceToHistory(preference);
  }

}

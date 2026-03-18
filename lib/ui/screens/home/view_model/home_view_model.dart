import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preferences_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferencesState ridePreferencesState;

  HomeViewModel({required this.ridePreferencesState}) {
    ridePreferencesState.addListener(_onRidePrefStateChange);
  }

  void _onRidePrefStateChange() {
    notifyListeners();
  }
  //having the user's ridepref in the rideprefstate then other can access it
  //rideprefstate is a global state then it can share data globally

  void onRidePrefSelected(RidePreference selectedPreference) {
    ridePreferencesState.selectPreference(selectedPreference);
  }

  RidePreference? get selectedPreference =>
      ridePreferencesState.selectedPreference;
      
  List<RidePreference> get preferenceHistory =>
      ridePreferencesState.preferenceHistory.reversed.toList();

  @override
  void dispose() {
    ridePreferencesState.removeListener(_onRidePrefStateChange);
    super.dispose();
  }
}

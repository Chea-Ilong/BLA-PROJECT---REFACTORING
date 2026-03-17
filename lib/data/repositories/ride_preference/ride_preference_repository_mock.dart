import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  @override
  List<RidePreference> fetchRidePreferences() {
    return fakeRidePrefs;
  }

  @override
  void addPreferenceToHistory(RidePreference preference) {
    fakeRidePrefs.add(preference);
  }
}

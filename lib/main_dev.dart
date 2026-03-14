import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride/ride_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:provider/provider.dart';
import 'main_common.dart';

/// Configure provider dependencies for dev environment
List<InheritedProvider> get devProviders {
  return [
    // 1 - Inject the song repository
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RidePreferenceRepository>(
      create: (_) => RidePreferenceRepositoryMock(),
    ),
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
  ];
}

void main() {
  mainCommon(devProviders);
}

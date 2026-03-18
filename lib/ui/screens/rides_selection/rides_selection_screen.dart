import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_selection_content.dart';
import 'package:blabla/ui/states/ride_preferences_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///

class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(context) {
    return ChangeNotifierProvider(
      create: (_) => RideSelectionViewModel(
        ridePreferencesState: context.read<RidePreferencesState>(),
        repository: context.read<RideRepository>()
      ),
      child: Consumer<RideSelectionViewModel>(
        builder: (context, rideSelectionViewModel, child) {
          return RideSelectionContent(rideSelectionViewModel: rideSelectionViewModel,);
        },
      ),
    );
  }
}

import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_content.dart';
import 'package:blabla/ui/states/ride_preferences_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(
       ridePreferencesState: context.read<RidePreferencesState>(),
      ),
      child: Consumer<HomeViewModel>(
        builder: (context, homeViewModel, child) {
          return HomeContent(vm: homeViewModel);
        },
      ),
    );
  }
}

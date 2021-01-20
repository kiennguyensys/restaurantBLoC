
import 'package:flutter/material.dart';
import 'package:restaurant_app/BLoC/bloc_provider.dart';
import 'package:restaurant_app/BLoC/location_bloc.dart';
import 'package:restaurant_app/DataLayer/location.dart';
import 'package:restaurant_app/UI/location_screen.dart';
import 'package:restaurant_app/UI/restaurant_screen.dart';
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Location>(
      // 1
      stream: BlocProvider.of<LocationBloc>(context).locationStream,
      builder: (context, snapshot) {
        final location = snapshot.data;

        // 2
        if (location == null) {
          return LocationScreen();
        }
        
        // This will be changed this later
        return RestaurantScreen(location: location);
        
      },
    );
  }
}

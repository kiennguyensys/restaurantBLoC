import 'dart:async';

import 'package:restaurant_app/BLoC/bloc.dart';
import 'package:restaurant_app/DataLayer/ZomatoClient.dart';
import 'package:restaurant_app/DataLayer/location.dart';
import 'package:restaurant_app/DataLayer/restaurant.dart';

class RestaurantBloc implements Bloc {
  final Location location;
  final _client = ZomatoClient();
  final _controller = StreamController<List<Restaurant>>();

  Stream<List<Restaurant>> get stream => _controller.stream;
  RestaurantBloc(this.location);

  void submitQuery(String query) async {
    final results = await _client.fetchRestaurants(location, query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}

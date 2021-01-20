import 'dart:async';

import 'package:restaurant_app/BLoC/bloc.dart';
import 'package:restaurant_app/DataLayer/ZomatoClient.dart';
import 'package:restaurant_app/DataLayer/location.dart';

class LocationQueryBloc implements Bloc {
  final _controller = StreamController<List<Location>>();
  final _client = ZomatoClient();
  Stream<List<Location>> get locationStream => _controller.stream;

  void submitQuery(String query) async {
    // 1
    final results = await _client.fetchLocations(query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
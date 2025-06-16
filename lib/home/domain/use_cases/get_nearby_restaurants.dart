import 'package:auvshop/home/domain/entities/restaurant.dart';
import 'package:auvshop/home/domain/repositories/home_repository.dart';

class GetNearbyRestaurants {
  final HomeRepository repository;

  GetNearbyRestaurants(this.repository);

  Future<List<Restaurant>> call() async {
    return await repository.getNearbyRestaurants();
  }
}

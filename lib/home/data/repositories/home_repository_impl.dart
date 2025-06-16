import 'package:auvshop/home/data/data_sources/home_remote_data_source.dart).dart';
import 'package:auvshop/home/domain/entities/restaurant.dart';
import 'package:auvshop/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<List<Restaurant>> getNearbyRestaurants() {
    return dataSource.fetchNearbyRestaurants();
  }
}

import 'package:auvshop/home/data/models/restaurant_model.dart).dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRemoteDataSource {
  final SupabaseClient client;

  HomeRemoteDataSource(this.client);

  Future<List<RestaurantModel>> fetchNearbyRestaurants() async {
    final response = await client
        .from('restaurants')
        .select();

    return (response as List)
        .map((json) => RestaurantModel.fromJson(json))
        .toList();
  }
}

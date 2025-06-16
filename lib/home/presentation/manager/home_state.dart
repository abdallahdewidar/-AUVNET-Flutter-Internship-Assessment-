import 'package:auvshop/home/domain/entities/restaurant.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<Restaurant> restaurants;

  HomeLoaded(this.restaurants);
}
class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

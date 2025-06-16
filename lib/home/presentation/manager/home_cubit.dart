import 'package:auvshop/home/domain/use_cases/get_nearby_restaurants.dart';
import 'package:auvshop/home/presentation/manager/home_cubit.dart';
import 'package:auvshop/home/presentation/manager/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetNearbyRestaurants getRestaurants;

  HomeCubit(this.getRestaurants) : super(HomeInitial());

  Future<void> loadRestaurants() async {
    emit(HomeLoading());
    try {
      final data = await getRestaurants();
      emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}

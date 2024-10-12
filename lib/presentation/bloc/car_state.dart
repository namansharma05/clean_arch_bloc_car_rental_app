import 'package:clean_arch_bloc_car_rental_app/data/models/car.dart';

abstract class CarState {}

class CarLoadingState extends CarState {}

class CarLoadedState extends CarState {
  final List<Car>? cars;

  CarLoadedState({this.cars});
}

class CarErrorState extends CarState {
  final String? errorMessage;

  CarErrorState({this.errorMessage});
}

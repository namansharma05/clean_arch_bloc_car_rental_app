import 'dart:async';

import 'package:clean_arch_bloc_car_rental_app/domain/usecases/get_cars.dart';
import 'package:clean_arch_bloc_car_rental_app/presentation/bloc/car_event.dart';
import 'package:clean_arch_bloc_car_rental_app/presentation/bloc/car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars? getCars;

  CarBloc({this.getCars}) : super(CarLoadingState()) {
    on<LoadCars>(loadCars);
  }

  Future<void> loadCars(LoadCars event, Emitter<CarState> emit) async {
    emit(CarLoadingState());
    try {
      final cars = await getCars!.call();
      emit(CarLoadedState(cars: cars));
    } catch (error) {
      emit(CarErrorState(errorMessage: error.toString()));
    }
  }
}

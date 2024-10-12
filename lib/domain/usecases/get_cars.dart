import 'package:clean_arch_bloc_car_rental_app/data/models/car.dart';
import 'package:clean_arch_bloc_car_rental_app/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository? carRepository;

  GetCars({this.carRepository});

  Future<List<Car>> call() async {
    return await carRepository!.fetchCars();
  }
}

import 'package:clean_arch_bloc_car_rental_app/data/datasources/firebase_car_datasource.dart';
import 'package:clean_arch_bloc_car_rental_app/data/models/car.dart';
import 'package:clean_arch_bloc_car_rental_app/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDatasource? firebaseCarDatasource;

  CarRepositoryImpl({this.firebaseCarDatasource});
  @override
  Future<List<Car>> fetchCars() {
    return firebaseCarDatasource!.getCars();
  }
}

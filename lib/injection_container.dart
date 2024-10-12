import 'package:clean_arch_bloc_car_rental_app/data/datasources/firebase_car_datasource.dart';
import 'package:clean_arch_bloc_car_rental_app/data/repositories/car_repository_impl.dart';
import 'package:clean_arch_bloc_car_rental_app/domain/repositories/car_repository.dart';
import 'package:clean_arch_bloc_car_rental_app/domain/usecases/get_cars.dart';
import 'package:clean_arch_bloc_car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void init() {
  try {
    // datasource
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDatasource>(
        () => FirebaseCarDatasource(firestore: getIt<FirebaseFirestore>()));

    // repository
    getIt.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(
        firebaseCarDatasource: getIt<FirebaseCarDatasource>()));

    // usercase
    getIt.registerLazySingleton<GetCars>(
        () => GetCars(carRepository: getIt<CarRepository>()));

    // bloc
    getIt.registerFactory<CarBloc>(() => CarBloc(getCars: getIt<GetCars>()));
  } catch (error) {
    throw error;
  }
}

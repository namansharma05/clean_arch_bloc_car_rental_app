import 'package:clean_arch_bloc_car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:clean_arch_bloc_car_rental_app/presentation/bloc/car_state.dart';
import 'package:clean_arch_bloc_car_rental_app/presentation/widgets/car_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is CarLoadedState) {
            return ListView.builder(
              itemCount: state.cars!.length,
              itemBuilder: (context, index) {
                return CarCard(
                  car: state.cars![index],
                );
              },
            );
          } else if (state is CarErrorState) {
            return Center(
              child: Text(state.errorMessage!),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

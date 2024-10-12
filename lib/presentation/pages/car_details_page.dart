import 'package:clean_arch_bloc_car_rental_app/data/models/car.dart';
import 'package:clean_arch_bloc_car_rental_app/presentation/pages/map_details_page.dart';
import 'package:clean_arch_bloc_car_rental_app/presentation/widgets/car_card.dart';
import 'package:clean_arch_bloc_car_rental_app/presentation/widgets/more_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget {
  final Car? car;
  const CarDetailsPage({super.key, this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            width: 60,
            child: Icon(CupertinoIcons.back),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.info_outline), Text(" Information")],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            car: Car(
                model: car!.model,
                distance: car!.distance,
                fuelCapacity: car!.fuelCapacity,
                pricePerHour: car!.pricePerHour),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ]),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/user.png"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Jane Copper",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$4.254",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapDetailsPage(
                                    car: car,
                                  )));
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage('assets/maps.png'),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5,
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                  car: Car(
                      model: car!.model! + "-1",
                      distance: car!.distance,
                      fuelCapacity: car!.fuelCapacity,
                      pricePerHour: car!.pricePerHour),
                ),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                  car: Car(
                      model: car!.model! + "-2",
                      distance: car!.distance,
                      fuelCapacity: car!.fuelCapacity,
                      pricePerHour: car!.pricePerHour),
                ),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                  car: Car(
                      model: car!.model! + "-3",
                      distance: car!.distance,
                      fuelCapacity: car!.fuelCapacity,
                      pricePerHour: car!.pricePerHour),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

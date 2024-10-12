import 'package:clean_arch_bloc_car_rental_app/firebase_options.dart';
import 'package:clean_arch_bloc_car_rental_app/injection_container.dart';
import 'package:clean_arch_bloc_car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:clean_arch_bloc_car_rental_app/presentation/bloc/car_event.dart';
import 'package:clean_arch_bloc_car_rental_app/presentation/pages/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CarBloc(
            getCars: getIt(),
          )..add(LoadCars()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}

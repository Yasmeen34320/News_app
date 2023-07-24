import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Data/Cubit/cubit/all_news_cubit_cubit.dart';
import 'Screens/detailed_screen.dart';
import 'Screens/openning_screen.dart';
import 'Shared/cardimage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllNewsCubitCubit>(
          create: (context) => AllNewsCubitCubit(),
        ),
     
      ],
     
  
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: //detailed_screen(),
            // Card_image(index: 0),
            openning_screen(),
      ),
    );
  }
}

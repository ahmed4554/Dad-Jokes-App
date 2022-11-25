import 'package:dad_jokes/cubit/main_cubit.dart';
import 'package:dad_jokes/cubit/main_states.dart';
import 'package:dad_jokes/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/bloc_observer.dart';
import 'modules/main_screen/main_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.dioInitial();

  runApp(const MainClass());
}

class MainClass extends StatelessWidget {
  const MainClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getRandomJoke(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          theme: ThemeData(platform: TargetPlatform.iOS),
          home: MainScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:dad_jokes/constants/colors.dart';
import 'package:dad_jokes/model/random_joke_model.dart';
import 'package:dad_jokes/network/remote/dio_helper.dart';
import 'package:dad_jokes/network/remote/end_point/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_states.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitialState());
  static MainCubit get(context) => BlocProvider.of(context);
  JokeModel? randomJokeModel;
  List<JokeModel> jokes = [];

  Future<void> getRandomJoke() async {
    emit(GetRandomJokeLoading());
    await DioHelper.getData(endpoint: RANDOM).then((value) {
      randomJokeModel = JokeModel.fromJson(value.data);
      if (randomJokeModel!.setup != null || randomJokeModel!.delivery != null) {
        jokes.add(randomJokeModel as JokeModel);
      }

      emit(GetRandomJokeSucces());
      log(jokes.toString());
    }).catchError((e) {
      emit(GetRandomJokeFail(e.toString()));
      log(e.toString());
    });
  }

  void changeAppColor(int index) {
    mainColor = colors[index];
    emit(ChangeColor());
  }
}

abstract class MainState {}

class InitialState extends MainState {}

class GetRandomJokeLoading extends MainState {}

class GetRandomJokeSucces extends MainState {}

class GetRandomJokeFail extends MainState {
  final String error;
  GetRandomJokeFail(this.error);
}

class ChangeColor extends MainState {}

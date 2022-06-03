part of 'game_bloc.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameInitialState extends GameState {}

class GameLoadingState extends GameState {}

class GameLoadedState extends GameState {
  final List<Game> apiResult;

  const GameLoadedState({required this.apiResult});

  @override
  List<Object> get props => [apiResult];
}

class GameErrorState extends GameState {}

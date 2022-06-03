import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_rest_api/models/game.dart';
import 'package:games_rest_api/repository/game_repo.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameRepo _gameRepo;
  
  GameBloc(this._gameRepo) : super(GameInitialState()) {
    on<GameEvent>((event, emit) async {
      if (event is LoadGamesEvent) {
        emit(GameLoadingState());
        List<Game>? apiResult = await _gameRepo.getGames();
        if (apiResult == null) {
          emit(GameErrorState());
        } else {
          emit(GameLoadedState(apiResult: apiResult));
        }
      }
    });
  }
}

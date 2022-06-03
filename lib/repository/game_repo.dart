import 'package:games_rest_api/models/game.dart';
import 'package:http/http.dart' as http;

class GameRepo {
  Future<List<Game>?> getGames() async {
    final url = Uri.parse('https://www.gamerpower.com/api/giveaways');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final game = Game.parseGame(response.body);
      return game;
    } else {
      throw Exception('Something went wrong');
    }
  }
}

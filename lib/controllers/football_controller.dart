import 'package:get/get.dart';
import 'package:latihan1/models/football_model.dart';

class FootballController extends GetxController{
    var players = <Player>[
    Player(
      profileImage: 'https://tse2.mm.bing.net/th/id/OIP.5cZj2MW7F8rWKrujNRlIIgHaE8?pid=Api&P=0&h=180',
      name: 'Desire Doue',
      position: 'MidFielder',
      number: 09,
    ),
    Player(
      profileImage: 'https://tse1.mm.bing.net/th/id/OIP.LYPzGQXJMBZqBfCl5k_yfQHaE7?pid=Api&P=0&h=180',
      name: 'Antony Santos',
      position: 'Winger',
      number: 21,
    ),
    Player(
      profileImage: 'https://tse4.mm.bing.net/th/id/OIP.p2AZokhEoA2f5eY8BubcBwHaEk?pid=Api&P=0&h=180',
      name: 'David Raya',
      position: 'Keeper',
      number: 1,
    ),
    Player(
      profileImage: 'https://tse4.mm.bing.net/th/id/OIP.O0UN7mv2kUXm6ZhNeBEVjQHaEK?pid=Api&P=0&h=180',
      name: 'Victor Gyokeres',
      position: 'Forward',
      number: 14,
    ),
    Player(
      profileImage: 'https://tse2.mm.bing.net/th/id/OIP.0AvofNtwdPJGmdn0MhwWGwHaDt?pid=Api&P=0&h=180',
      name: 'Mathijts de Ligt',
      position: 'Back',
      number: 4,
    ),
  ].obs;

  static var to;

  void updatePlayer(int index, Player newPlayer) {
    players[index] = newPlayer; 
  }
}
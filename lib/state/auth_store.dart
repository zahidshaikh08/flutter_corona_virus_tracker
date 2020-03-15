import 'package:rab_corona_virus_tracker/api/firebase_repository.dart';
import 'package:rab_corona_virus_tracker/data/model/twitter_user.dart';

class AuthStore {
  TwitterUser _twitterUser;

  TwitterUser get user => _twitterUser;

  void createTwitterAccount(String email, String password) async {
    _twitterUser = await FirebaseRepository.createAccount(email, password);
  }

  void loginUser(String email, String password) async {
    _twitterUser = await FirebaseRepository.login(email, password);
  }
}

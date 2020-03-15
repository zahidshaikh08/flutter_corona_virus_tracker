import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:rab_corona_virus_tracker/services/navigator_service.dart';
import 'package:rab_corona_virus_tracker/services/shared_preferences_service.dart';

GetIt getIT = GetIt();

void setupLocator(BuildContext context) {
  getIT.registerSingleton(TwitterSharedPreference(context: context));
  getIT.registerSingleton(NavigationService(context: context));
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/help_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/get_help_request.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  Future<bool> checkIsLoggedIn() async {
    // here we get the boolean value from sharedPreference if the user the loggin in
    // we get value of true and then we can navigate to the main screen
    // instead of navigating to the login screen.
    final isLoggedIn =
        await CacheHelper.getDataFromSharedPreference(key: 'IS-LOGGED-IN');
    // If is the first time to open the app no data will be returned so we check first
    // if the value not null.
    if (isLoggedIn != null) {
      return isLoggedIn;
    } else {
      // if the value is null so we return false.
      return Future.value(false);
    }
  }

  Future<void> getHelp() async {
    emit(LoadingState());
    final isConnceted = await InternetConnectionCheckerPlus().hasConnection;
    if (isConnceted) {
      final List<HelpModel> helpList = await GetHelpRequest.getHelp();
      emit(HelpListLoadedState(helpList: helpList));
      final helpListJson = helpList.map((item) => item.toJson()).toList();
      CacheHelper.saveDataSharedPreference(
          key: 'HELP-DATA', value: json.encode(helpListJson));
    } else {
      print('getting local help list');
      final helpListString =
          await CacheHelper.getDataFromSharedPreference(key: 'HELP-DATA');
      final List helpListJson = json.decode(helpListString);
      final helpList = helpListJson.map((e) => HelpModel.fromJson(e)).toList();
      emit(HelpListLoadedState(helpList: helpList));
    }
  }
}
